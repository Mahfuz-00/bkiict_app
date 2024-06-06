
import 'package:bkiict_app/Connection%20Checker/internetconnectioncheck.dart';
import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../API Model and Service (Course Dashboard)/apiServiceCourseDashboard.dart';
import '../Login UI/loginUI.dart';
import '../Template Models/coursecard.dart';
import '../Template Models/courseinfo.dart';
import '../Template Models/templateerrorcontainer.dart';

class LongCourses extends StatefulWidget {
  final bool shouldRefresh;
  const LongCourses({Key? key, this.shouldRefresh = false}) : super(key: key);

  @override
  State<LongCourses> createState() => _LongCoursesState();
}

class _LongCoursesState extends State<LongCourses> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  List<Widget> OngoingCourses = [];
  List<Widget> UpcomingCourses = [];
  bool _isFetched = false;
  bool _isLoading = false;
  bool _pageLoading = true;
  bool _errorOccurred = false;
  late String userName = '';
  late String organizationName = '';
  late String photoUrl = '';
  List<String> notifications = [];

  Future<void> loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
      organizationName = prefs.getString('organizationName') ?? '';
      photoUrl = prefs.getString('photoUrl') ?? '';
      photoUrl = 'https://bcc.touchandsolve.com' + photoUrl;
      print('User Name: $userName');
      print('Organization Name: $organizationName');
      print('Photo URL: $photoUrl');
      print('User profile got it!!!!');
    });
  }

  Future<void> fetchCourses() async {
    if (_isFetched) return;
    try {
      final apiService = await CourseDashboardAPIService.create();

      // Fetch dashboard data
      final Map<String, dynamic>? dashboardData =
      await apiService.Courses(type: 'long');
      if (dashboardData == null || dashboardData.isEmpty) {
        // No data available or an error occurred
        print('No data available or error occurred while fetching Course Data');
        return;
      }
      print(dashboardData);

      final Map<String, dynamic>? records = dashboardData['records'] ?? [];
      print(records);
      if (records == null || records.isEmpty) {
        // No records available
        print('No records available');
        return;
      }

      // Set isLoading to true while fetching data
      setState(() {
        _isLoading = true;
      });

      // Extract notifications
      notifications = List<String>.from(records['notifications'] ?? []);

      // Simulate fetching data for 5 seconds
      await Future.delayed(Duration(seconds: 3));

      final List<dynamic> pendingRequestsData = records['ongoing'] ?? [];
      for (var index = 0; index < pendingRequestsData.length; index++) {
        print(
            'Pending Request at index $index: ${pendingRequestsData[index]}\n');
      }
      final List<dynamic> acceptedRequestsData = records['upcoming'] ?? [];
      for (var index = 0; index < acceptedRequestsData.length; index++) {
        print(
            'Accepted Request at index $index: ${acceptedRequestsData[index]}\n');
      }

      // Map pending requests to widgets
      final List<Widget> pendingWidgets = pendingRequestsData.map((request) {
        print('Pending Trip');
        print(request['name']);
        print(request['designation']);
        print(request['department']);
        print(request['purpose']);
        print(request['phone']);
        print(request['destination_from']);
        print(request['destination_to']);
        print(request['date']);
        print(request['time']);
        print(request['trip_type']);
        return CourseCard(
          course: Course(
              courseId: request['course_id'],
              courseName: request['course_name'],
              batchNo: request['batch_no'],
              courseFee: request['course_fee'],
              classes: request['classes'],
              duration: request['duration'],
              classStart: request['class_start'],
              shift: request['shift'],
              regDeadline: request['reg_deadline']),
        );
      }).toList();

      // Map accepted requests to widgets
      final List<Widget> acceptedWidgets = acceptedRequestsData.map((request) {
        return CourseCard(
          course: Course(
              courseId: request['course_id'],
              courseName: request['course_name'],
              batchNo: request['batch_no'],
              courseFee: request['course_fee'],
              classes: request['classes'],
              duration: request['duration'],
              classStart: request['class_start'],
              shift: request['shift'],
              regDeadline: request['reg_deadline']),
        );
      }).toList();

      setState(() {
        OngoingCourses = pendingWidgets;
        UpcomingCourses = acceptedWidgets;
        _isFetched = true;
      });
    } catch (e) {
      print('Error fetching trip requests: $e');
      _isFetched = true;
      //_errorOccurred = true;
      // Handle error as needed
    }
  }

  @override
  void initState() {
    super.initState();
    print('initState called');
    _tabController = TabController(length: 2, vsync: this);
    loadUserProfile();
    Future.delayed(Duration(seconds: 5), () {
      if (widget.shouldRefresh && !_isFetched) {
        loadUserProfile();
        // Refresh logic here, e.g., fetch data again
        print('Page Loading Done!!');
        // connectionRequests = [];
        if (!_isFetched) {
          fetchCourses();
          //_isFetched = true; // Set _isFetched to true after the first call
        }
      }
      // After 5 seconds, set isLoading to false to stop showing the loading indicator
      setState(() {
        print('Page Loading');
        _pageLoading = false;
      });
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  _pageLoading
        ? Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Show circular loading indicator while waiting
        child: CircularProgressIndicator(),
      ),
    )
        :  InternetChecker(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
          titleSpacing: 5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          title: const Text(
            'Long Courses',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'default',
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(height: 0.5,),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(134, 188, 66, 1),
                  ),
                  child: TabBar(
                    padding: EdgeInsets.zero,
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text(
                          'Ongoing Course',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Upcoming Course',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //Ongoing Courses
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Ongoing Courses',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        //height: screenHeight*0.25,
                        child: FutureBuilder<void>(
                            future: _isLoading
                                ? null
                                : fetchCourses(),
                            builder: (context, snapshot) {
                              if (!_isFetched) {
                                // Return a loading indicator while waiting for data
                                return Container(
                                  height: 200, // Adjust height as needed
                                  width:
                                  screenWidth, // Adjust width as needed
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                // Handle errors
                                return buildNoRequestsWidget(screenWidth,
                                    'Error: ${snapshot.error}');
                              } else if (_isFetched) {
                                if (OngoingCourses.isNotEmpty) {
                                  // If data is loaded successfully, display the ListView
                                  return Container(
                                    child: Column(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                          NeverScrollableScrollPhysics(),
                                          itemCount:
                                          OngoingCourses.length > 10
                                              ? 10
                                              : OngoingCourses.length,
                                          itemBuilder: (context, index) {
                                            // Display each connection request using ConnectionRequestInfoCard
                                            return OngoingCourses[index];
                                          },
                                          separatorBuilder: (context,
                                              index) =>
                                          const SizedBox(height: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        /*if (shouldShowSeeAllButton(
                                                    pendingRequests))
                                                  buildSeeAllButtonRequestList(
                                                      context)*/
                                      ],
                                    ),
                                  );
                                } else if (OngoingCourses.isEmpty) {
                                  // Handle the case when there are no pending connection requests
                                  return buildNoRequestsWidget(
                                      screenWidth,
                                      'No Ongoing Course right now.');
                                }
                              }
                              // Return a default widget if none of the conditions above are met
                              return SizedBox(); // You can return an empty SizedBox or any other default widget
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Upcoming Courses
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
                child: Container(
                  color: Colors.grey[100],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Upcoming Courses',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        //height: screenHeight*0.25,
                        child: FutureBuilder<void>(
                            future: _isLoading
                                ? null
                                : fetchCourses(),
                            builder: (context, snapshot) {
                              if (!_isFetched) {
                                // Return a loading indicator while waiting for data
                                return Container(
                                  height: 200, // Adjust height as needed
                                  width:
                                  screenWidth, // Adjust width as needed
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                // Handle errors
                                return buildNoRequestsWidget(screenWidth,
                                    'Error: ${snapshot.error}');
                              } else if (_isFetched) {
                                if (UpcomingCourses.isNotEmpty) {
                                  // If data is loaded successfully, display the ListView
                                  return Container(
                                    child: Column(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                          NeverScrollableScrollPhysics(),
                                          itemCount:
                                          UpcomingCourses.length > 10
                                              ? 10
                                              : UpcomingCourses
                                              .length,
                                          itemBuilder: (context, index) {
                                            // Display each connection request using ConnectionRequestInfoCard
                                            return UpcomingCourses[index];
                                          },
                                          separatorBuilder: (context,
                                              index) =>
                                          const SizedBox(height: 10),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        /*if (shouldShowSeeAllButton(
                                                    pendingRequests))
                                                  buildSeeAllButtonRequestList(
                                                      context)*/
                                      ],
                                    ),
                                  );
                                } else if (UpcomingCourses.isEmpty) {
                                  // Handle the case when there are no pending connection requests
                                  return buildNoRequestsWidget(
                                      screenWidth,
                                      'No Upcoming Course.');
                                }
                              }
                              // Return a default widget if none of the conditions above are met
                              return SizedBox(); // You can return an empty SizedBox or any other default widget
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
