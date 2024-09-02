import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../Core/Connection Checker/internetconnectioncheck.dart';
import '../../Data/Data Sources/API Service (Course Details)/apiServiceCourseDetails.dart';
import '../../Data/Models/courseDetailsModel.dart';

/// A widget that displays the details of a course.
///
/// The [CourseDetails] widget fetches and shows the information
/// about a specific course based on the provided [courseId] and [batch].
/// It handles loading states, errors, and presents the course summary and details.
///
/// Requires:
/// - [courseId]: An integer representing the ID of the course.
/// - [batch]: An integer representing the batch number.
/// - [shouldRefresh]: A boolean that determines if the course details should be refreshed.
class CourseDetails extends StatefulWidget {
  final int courseId;
  final int batch;
  final bool shouldRefresh;

  const CourseDetails({
    Key? key,
    this.shouldRefresh = false,
    required this.courseId,
    required this.batch,
  }) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late int courseId;
  late int batch;
  bool _isFetched = false;
  bool _isLoading = false;
  bool _pageLoading = true;
  bool _errorOccurred = false;
  late CourseDetail _course;

  late int _id = 0;
  late String _name = '';
  late String _overview = '';
  late String _requirements = '';
  late String _project = '';
  late String _tools = '';
  late String _outline = '';
  late String _duration = '';
  late String _hours = '';
  late String _fee = '';
  late String _shift = '';
  late String _classes = '';
  late String _type = '';
  late String _center = '';
  late String _status = '';
  late String _batch = '';
  late String _regdeadline = '';
  late String _startdate = '';
  late String _batchenddate = '';
  late String _cordinatorName = '';
  late String _coordinatorImage = '';
  late Coordinator _coordinator = Coordinator(name: '', photo: '');
  late List<Instructor> _instructors = [];

  Future<void> fetchCourses() async {
    if (_isFetched) return;
    print('invoked');
    try {
      final apiService = await CourseDetailsAPIService.create();

      print(widget.courseId);
      print(widget.batch);

      final Map<String, dynamic>? dashboardData = await apiService.CourseDetail(
          Id: widget.courseId, BatchId: widget.batch);
      if (dashboardData == null || dashboardData.isEmpty) {
        print('No data available or error occurred while fetching Course Data');
        return;
      }
      print(dashboardData);

      final Map<String, dynamic>? records = dashboardData['records'];
      print(records);
      if (records == null || records.isEmpty) {
        print('No records available');
        return;
      }

      _id = records['id'];
      _name = records['name'];
      _overview = records['overview'];
      _requirements = records['requirements'];
      _project = records['project'];
      _tools = records['tools'];
      _outline = records['outline'];
      _duration = records['duration'];
      _hours = records['hours'];
      _fee = records['fee'];
      _shift = records['shift'];
      _classes = records['classes'];
      _type = records['type'];
      _center = records['center'];
      _status = records['status'];
      _batch = records['batch_number'];
      _regdeadline = records['reg_deadline'];
      _startdate = records['class_start'];
      _batchenddate = records['batch_end'];
      _cordinatorName = records['cordinator']['name'];
      _coordinatorImage = records['cordinator']['photo'];
      _instructors = List<Instructor>.from(
          records['instructors'].map((x) => Instructor.fromJson(x)));

      print('Course ID: ${records['id']}');
      print('Course Name: ${records['name']}');
      print('Overview: ${records['overview']}');
      print('Requirements: ${records['requirements']}');
      print('Project: ${records['project']}');
      print('Tools: ${records['tools']}');
      print('Outline: ${records['outline']}');
      print('Duration: ${records['duration']}');
      print('Hours: ${records['hours']}');
      print('Fee: ${records['fee']}');
      print('Shift: ${records['shift']}');
      print('Classes: ${records['classes']}');
      print('Type: ${records['type']}');
      print('Batch: ${records['batch_number']}');
      print('Registration Deadline: ${records['reg_deadline']}');
      print('Start Date: ${records['class_start']}');
      print('Batch End Date: ${records['batch_end']}');
      print('Center: ${records['center']}');
      print('Status: ${records['status']}');
      print('Coordinator Name: ${records['cordinator']['name']}');
      print('Coordinator Photo: ${records['cordinator']['photo']}');
      for (var instructor in records['instructors']) {
        print('Instructor Name: ${instructor['name']}');
        print('Instructor Photo: ${instructor['photo']}');
      }

      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 3));

      setState(() {
        _isFetched = true;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching course details: $e');
      setState(() {
        _isFetched = true;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    print('initState called');
    courseId = widget.courseId;
    batch = widget.batch;
    if (!_isFetched) {
      fetchCourses();
    }
    Future.delayed(Duration(seconds: 5), () {
      if (widget.shouldRefresh) {
        print('Page Loading Done!!');
      }
      setState(() {
        print('Page Loading');
        _pageLoading = false;
      });
    });
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
        : InternetChecker(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                leadingWidth: 40,
                titleSpacing: 10,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    )),
                title: const Text(
                  'Course Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'default',
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          _name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Course Overview/Course Objective',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _overview,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Requirement',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _requirements,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Course Project',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _project,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Used Tools',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _tools,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text('Course Outline',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          )),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          _outline,
                          style: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width: screenWidth * 0.9,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 188, 66, 1),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Course Summary',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'default',
                                      ),
                                    ),
                                  )),
                              Container(
                                width: screenWidth * 0.9,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildRow('Course Type', _type),
                                    _buildRow('Course Duration', _duration),
                                    _buildRow('Course Hour(s)', _hours),
                                    _buildRow('Classes', _classes),
                                    _buildRow('Course Fee', _fee),
                                    _buildRow('Batch No', _batch),
                                    _buildRow('Center', _center),
                                    _buildRow(
                                        'Registration Deadline', _regdeadline),
                                    _buildRow('Class Shift', _shift),
                                    _buildRow('Class Start', _startdate),
                                    _buildRow('Class End', _batchenddate),
                                    _buildRow('Course Status', _status)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width: screenWidth * 0.9,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 188, 66, 1),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Course Schedule',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'default',
                                      ),
                                    ),
                                  )),
                              Container(
                                width: screenWidth * 0.9,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    _buildRow('Class Time', '3:30 PM')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width: screenWidth * 0.9,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 188, 66, 1),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Course Cordinator',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'default',
                                      ),
                                    ),
                                  )),
                              Container(
                                width: screenWidth * 0.9,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  children: [
                                    (_coordinator.photo != null &&
                                            _coordinator.photo != 'None')
                                        ? Image.network(
                                            _coordinatorImage,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(
                                                Icons.person,
                                                size: 60,
                                              ); // Default person icon
                                            },
                                          )
                                        : Icon(Icons.person),
                                    // Default person icon when _coordinator.photo is null or 'None'
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Text(_cordinatorName,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(
                                                143, 150, 158, 1),
                                            fontFamily: 'default',
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  width: screenWidth * 0.9,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(134, 188, 66, 1),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Course Instructor(s)',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'default',
                                      ),
                                    ),
                                  )),
                              Container(
                                width: screenWidth * 0.9,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    for (var instructor in _instructors)
                                      Container(
                                        child: Column(
                                          children: [
                                            (instructor.photo != null ||
                                                    instructor.photo != 'None')
                                                ? Image.network(
                                                    instructor.photo!,
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Icon(
                                                        Icons.person,
                                                        size: 60,
                                                      );
                                                    },
                                                  )
                                                : Icon(
                                                    Icons.person,
                                                    size: 60,
                                                  ),
                                            SizedBox(height: 10),
                                            Text(
                                              instructor.name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    143, 150, 158, 1),
                                                fontFamily: 'default',
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ":",
            style: TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
