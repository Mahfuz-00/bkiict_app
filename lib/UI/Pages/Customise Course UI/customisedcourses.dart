import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/Data Sources/API Service (Course Dashboard)/apiServiceCourseDashboard.dart';
import '../../Widgets/coursecard.dart';
import '../../../Data/Models/courseinfo.dart';
import '../../Widgets/requestWidgetShowAll.dart';

/// This class represents the [CustomisedCoursesUI], which displays ongoing
/// and upcoming courses for the user.
///
/// [shouldRefresh] indicates whether the page should refresh the user profile data.
///
/// State management variables:
/// - [_scaffoldKey]: GlobalKey used for managing the scaffold state.
/// - [_tabController]: Controls the tab navigation for ongoing and upcoming courses.
/// - [OngoingCourses]: List of widgets representing ongoing courses.
/// - [UpcomingCourses]: List of widgets representing upcoming courses.
/// - [_isFetched]: Indicates whether course data has been fetched.
/// - [_isLoading]: Indicates whether course data is currently loading.
/// - [_pageLoading]: Indicates whether the page is in the loading state.
/// - [_errorOccurred]: Indicates if an error occurred while fetching data.
/// - [userName]: Stores the user's name.
/// - [organizationName]: Stores the user's organization name.
/// - [photoUrl]: Stores the user's photo URL.
/// - [notifications]: List of notifications related to courses.
///
/// Actions:
/// - [loadUserProfile]: Loads the user's profile data from shared preferences.
/// - [fetchCourses]: Fetches ongoing and upcoming courses from the API.
class CustomisedCoursesUI extends StatefulWidget {
  final bool shouldRefresh;
  const CustomisedCoursesUI({Key? key, this.shouldRefresh = false}) : super(key: key);

  @override
  State<CustomisedCoursesUI> createState() => _CustomisedCoursesUIState();
}

class _CustomisedCoursesUIState extends State<CustomisedCoursesUI> with SingleTickerProviderStateMixin{
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

      final Map<String, dynamic>? dashboardData =
      await apiService.Courses(type: 'customized');
      if (dashboardData == null || dashboardData.isEmpty) {
        print('No data available or error occurred while fetching Course Data');
        return;
      }
      print(dashboardData);

      final Map<String, dynamic>? records = dashboardData['records'] ?? [];
      print(records);
      if (records == null || records.isEmpty) {
        print('No records available');
        return;
      }

      setState(() {
        _isLoading = true;
      });

      notifications = List<String>.from(records['notifications'] ?? []);

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
    }
  }

  @override
  void initState() {
    super.initState();
    print('initState called');
    _tabController = TabController(length: 2, vsync: this);
    loadUserProfile();
    if (!_isFetched) {
      fetchCourses();
    }
    Future.delayed(Duration(seconds: 2), () {
      if (widget.shouldRefresh && !_isFetched) {
        loadUserProfile();
        print('Page Loading Done!!');
      }
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5202),
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
          'Customised Courses',
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
                  color: const Color(0xFFFF5202),
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
                          color: Color(0xFFFF5202),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    AllRequestsWidget(
                      loading: _isLoading,
                      fetch: _isFetched,
                      errorText: 'No Ongoing Course right now.',
                      listWidget: OngoingCourses,
                      fetchData: fetchCourses(),),
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
                          color: Color(0xFFFF5202),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    AllRequestsWidget(
                      loading: _isLoading,
                      fetch: _isFetched,
                      errorText: 'No Upcoming Course.',
                      listWidget: UpcomingCourses,
                      fetchData: fetchCourses(),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
