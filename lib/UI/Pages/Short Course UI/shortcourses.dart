import 'package:bkiict_app/UI/Widgets/requestWidgetShowAll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Core/Connection Checker/internetconnectioncheck.dart';
import '../../../Data/Data Sources/API Service (Course Dashboard)/apiServiceCourseDashboard.dart';
import '../../Widgets/coursecard.dart';
import '../../../Data/Models/courseinfo.dart';

/// [ShortCoursesUI] is a StatefulWidget that displays ongoing and upcoming short courses.
///
/// Variables:
/// - [shouldRefresh]: A boolean that indicates whether the UI should refresh.
///
/// State Variables:
/// - [_scaffoldKey]: A GlobalKey for the Scaffold widget.
/// - [_tabController]: A TabController to manage the tabs for ongoing and upcoming courses.
/// - [OngoingCourses]: A list of Widgets representing ongoing courses.
/// - [UpcomingCourses]: A list of Widgets representing upcoming courses.
/// - [_isFetched]: A boolean indicating whether the course data has been fetched.
/// - [_isLoading]: A boolean indicating whether the data is currently being loaded.
/// - [_pageLoading]: A boolean indicating whether the page is loading.
/// - [_errorOccurred]: A boolean indicating whether an error has occurred during data fetching.
/// - [userName]: A String representing the user's name.
/// - [organizationName]: A String representing the user's organization name.
/// - [photoUrl]: A String representing the user's photo URL.
/// - [notifications]: A list of Strings containing notifications related to the courses.
///
/// Actions:
/// - [loadUserProfile]: Loads user profile information from SharedPreferences.
/// - [fetchCourses]: Fetches ongoing and upcoming courses from the API.
class ShortCoursesUI extends StatefulWidget {
  final bool shouldRefresh;

  const ShortCoursesUI({Key? key, this.shouldRefresh = false}) : super(key: key);

  @override
  State<ShortCoursesUI> createState() => _ShortCoursesUIState();
}

class _ShortCoursesUIState extends State<ShortCoursesUI>
    with SingleTickerProviderStateMixin {
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
          await apiService.Courses(type: 'short');
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
            regDeadline: request['reg_deadline'],
          ),
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
    return _pageLoading
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : InternetConnectionChecker(
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
                  'Short Courses',
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
                      Divider(
                        height: 0.5,
                      ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            SizedBox(
                              height: 20,
                            ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            SizedBox(
                              height: 20,
                            ),
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
            ),
          );
  }
}
