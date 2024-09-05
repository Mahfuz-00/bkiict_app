import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/Data Sources/API Service (Center-Course)/apiServiceBatch.dart';
import '../../../Data/Data Sources/API Service (Center-Course)/apiServiceCenter.dart';
import '../../../Data/Data Sources/API Service (Center-Course)/apiServiceCourse.dart';
import '../../../Data/Models/firstPageModels.dart';
import '../../Widgets/dropdownfield.dart';
import '../../Widgets/dropdownoptionsfield.dart';
import 'registrationpersonalinfo.dart';

/// A UI widget for the registration center, allowing users to select
/// a center, course type, and course. This widget is responsible for
/// fetching and displaying the relevant data for centers, courses, and
/// batches. It manages the loading states and user interactions,
/// facilitating a smooth registration experience.
///
/// Variables:
/// - [selectedCenterValue]: Holds the selected center value.
/// - [selectedExamCategory]: Holds the selected exam category.
/// - [selectedExamType]: Holds the selected exam type.
/// - [selectedBook]: Holds the selected book.
/// - [selectedTutionFee]: Holds the selected tuition fee.
/// - [isLoadingCenters]: Indicates if the centers are being loaded.
/// - [isLoadingCourse]: Indicates if the courses are being loaded.
/// - [isLoadingBatch]: Indicates if the batches are being loaded.
/// - [centers]: List of available centers.
/// - [courses]: List of available courses.
/// - [batches]: List of available batches.
/// - [_centerID]: Holds the selected center ID.
/// - [_courseID]: Holds the selected course ID.
/// - [_Fee]: Holds the selected fee.
/// - [_batchID]: Holds the selected batch ID.
/// - [_isFetched]: Indicates if center data has been fetched.
/// - [_isFetchedCourse]: Indicates if course data has been fetched.
/// - [_isFetchedBatch]: Indicates if batch data has been fetched.
/// - [_pageLoading]: Indicates if the page is loading.
/// - [_isLoading]: Indicates if any loading operation is ongoing.
///
/// Actions:
/// - [fetchCenter]: Fetches the list of centers from the API.
/// - [handleCenters(List<dynamic> centerData)]: Handles the fetched center data.
/// - [fetchCourse(String centerId, String CourseType)]: Fetches the list of courses for a selected center.
/// - [handleCourse(List<dynamic> courseData)]: Handles the fetched course data.
/// - [fetchBatch(String courseId)]: Fetches the list of batches for a selected course.
/// - [handleBatch(List<dynamic> batchData)]: Handles the fetched batch data.
class RegistrationCenterUI extends StatefulWidget {
  const RegistrationCenterUI({super.key});

  @override
  State<RegistrationCenterUI> createState() => _RegistrationCenterUIState();
}

class _RegistrationCenterUIState extends State<RegistrationCenterUI>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _CourseTypecontroller = TextEditingController();

  String? selectedCenterValue;
  String? selectedExamCategory;
  String? selectedExamType;
  String? selectedBook;
  String? selectedTutionFee;
  bool isLoadingCenters = false;
  bool isLoadingCourse = false;
  bool isLoadingBatch = false;
  List<CenterOption> centers = [];
  List<Course> courses = [];
  List<BatchNo> batches = [];
  late String _centerID = '';
  late String _courseID = '';
  late String _Fee = '';
  late String _batchID = '';
  bool _isFetched = false;
  bool _isFetchedCourse = false;
  bool _isFetchedBatch = false;
  bool _pageLoading = true;
  bool _isLoading = false;

  Future<void> fetchCenter() async {
    if (_isFetched) return;
    setState(() {
      isLoadingCenters = true;
    });
    try {
      final apiService = await CenterAPIService.create();
      final Map<String, dynamic> dashboardData =
          await apiService.fetchCenterItems();
      if (dashboardData == null || dashboardData.isEmpty) {
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        print('No records available');
        return;
      }

      await handleCenters(records);
      setState(() {
        _isFetched = true;
      });
    } catch (e) {
      print('Error fetching center datas: $e');
      _isFetched = true;
    }
  }

  Future<void> handleCenters(List<dynamic> centerData) async {
    List<CenterOption> fetchedCenters = [];
    try {
      for (dynamic center in centerData) {
        CenterOption option = CenterOption(
          id: center['id'],
          name: center['name'],
        );
        fetchedCenters.add(option);
        print('Center Name: ${option.name}');
      }
      setState(() {
        isLoadingCenters = false;
        centers = fetchedCenters;
      });
    } catch (e) {
      print('Error handling centers: $e');
      setState(() {
        isLoadingCenters = false;
      });
    }
  }

  Future<void> fetchCourse(String centerId, String CourseType) async {
    print('Center Id: ${centerId}');
    print('Course Type: ${CourseType}');
    if (_isFetchedCourse) return;
    setState(() {
      isLoadingCourse = true;
    });
    try {
      final apiService = await CourseOptionAPIService.create();
      final Map<String, dynamic> dashboardData = await apiService
          .fetchCourseItems(Id: int.parse(centerId), coursetype: CourseType);
      if (dashboardData == null || dashboardData.isEmpty) {
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        print('No records available');
        return;
      }
      await handleCourse(records);
      setState(() {
        _isFetchedCourse = true;
      });
    } catch (e) {
      print('Error fetching course datas: $e');
      _isFetchedCourse = true;
    }
  }

  Future<void> handleCourse(List<dynamic> courseData) async {
    List<Course> fetchedCourses = [];
    try {
      for (dynamic course in courseData) {
        Course option = Course(
          id: course['id'],
          name: course['name'],
          fee: course['fee'],
        );
        fetchedCourses.add(option);
        print('Course Name: ${option.name}');
      }
      setState(() {
        isLoadingCourse = false;
        courses = fetchedCourses;
      });
    } catch (e) {
      print('Error handling centers: $e');
      setState(() {
        isLoadingCourse = false;
      });
    }
  }

  Future<void> fetchBatch(String courseId) async {
    print('Center Id: ${courseId}');
    if (_isFetchedBatch) return;
    setState(() {
      isLoadingBatch = true;
    });
    try {
      final apiService = await BatchAPIService.create();
      final Map<String, dynamic> dashboardData =
          await apiService.fetchBatchItems(Id: int.parse(courseId));
      if (dashboardData == null || dashboardData.isEmpty) {
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        print('No records available');
        return;
      }

      await handleBatch(records);
      setState(() {
        _isFetchedBatch = true;
      });
    } catch (e) {
      print('Error fetching Batch datas: $e');
      _isFetchedBatch = true;
    }
  }

  Future<void> handleBatch(List<dynamic> batchData) async {
    List<BatchNo> fetchedBatches = [];
    try {
      for (dynamic course in batchData) {
        BatchNo option = BatchNo(
          id: course['id'],
          number: course['batch_number'],
          name: course['name'],
        );
        fetchedBatches.add(option);
        print('Batch Number: ${option.number}');
      }
      setState(() {
        isLoadingBatch = false;
        batches = fetchedBatches;
      });
    } catch (e) {
      print('Error handling centers: $e');
      setState(() {
        isLoadingBatch = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCenter();
  }

  String? selectedCenter;
  String? selectedCourseType;
  String? selectedCourse;
  String? selectedBatchNo;

  List<DropdownMenuItem<String?>> courseTypeOptions = [
    DropdownMenuItem(child: Text("Short"), value: "short"),
    DropdownMenuItem(child: Text("Long"), value: "long"),
    DropdownMenuItem(child: Text("Customized"), value: "customized"),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          'Registration Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'default',
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Register here to learn creative skill',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select a Center',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      if (isLoadingCenters) ...[
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: const Color.fromRGBO(134, 188, 66, 1),
                          ),
                        ),
                      ],
                      DropdownFormField(
                        hintText: 'Select Center',
                        dropdownItems:
                            centers.map((center) => center.name).toList(),
                        initialValue: selectedCenterValue,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCenterValue = newValue!;
                          });
                          if (newValue != null) {
                            CenterOption selectedCenterObject =
                                centers.firstWhere(
                              (type) => type.name == newValue,
                            );
                            if (selectedCenterObject != null) {
                              _centerID = selectedCenterObject.id.toString();
                              print(_centerID);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select a Course Type',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownField(
                      hintText: 'Course Type',
                      dropdownItems: courseTypeOptions
                          .where((item) => item != null)
                          .map((item) => item!)
                          .toList(),
                      initialValue: null,
                      onChanged: (value) {
                        setState(() {
                          _CourseTypecontroller.text = value!;
                          print('Center ID: $_centerID');
                        });
                        if (_centerID != 0 &&
                            _CourseTypecontroller.text.isNotEmpty) {
                          fetchCourse(_centerID, _CourseTypecontroller.text);
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select a Course',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      if (isLoadingCourse) ...[
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: const Color.fromRGBO(134, 188, 66, 1),
                          ),
                        ),
                      ],
                      DropdownFormField(
                        hintText: 'Select Course',
                        dropdownItems:
                            courses.map((course) => course.name).toList(),
                        initialValue: selectedCourse,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCourse = newValue!;
                          });
                          if (newValue != null) {
                            Course selectedCourseObject = courses.firstWhere(
                              (type) => type.name == newValue,
                            );
                            if (selectedCourseObject != null) {
                              _Fee =
                                  selectedCourseObject.fee.toString() + ' TK';
                              _courseID = selectedCourseObject.id.toString();
                              fetchBatch(_courseID);
                              print(_courseID);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Course Free : ',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      _Fee != null && _Fee.isNotEmpty ? _Fee : 'Tution Fee',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'default',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select a Batch no',
                style: TextStyle(
                  color: Color.fromRGBO(143, 150, 158, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.075,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      if (isLoadingBatch) ...[
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: const Color.fromRGBO(134, 188, 66, 1),
                          ),
                        ),
                      ],
                      DropdownFormField(
                        hintText: 'Select Batch',
                        dropdownItems: batches
                            .map((batch) => '${batch.number} - ${batch.name}')
                            .toList(),
                        initialValue: selectedBatchNo,
                        onChanged: (newValue) {
                          setState(() {
                            selectedBatchNo = newValue!;
                            print(newValue);
                          });
                          if (newValue != null) {
                            BatchNo selectedBatchObject = batches.firstWhere(
                              (type) =>
                                  '${type.number} - ${type.name}' == newValue,
                            );
                            if (selectedBatchObject != null) {
                              _batchID = selectedBatchObject.id.toString();
                              print(_batchID);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.height * 0.08),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () async {
                      if (RegistrationCheck()) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('Center', _centerID);
                        await prefs.setString(
                            'Course Type', _CourseTypecontroller.text);
                        await prefs.setString('Course Name', _courseID);
                        await prefs.setString('Fee', _Fee);
                        await prefs.setString('Batch', _batchID);
                        await prefs.setString(
                            'Center Name', selectedCenterValue.toString());
                        await prefs.setString(
                            'Course_Name', selectedCourse.toString());
                        await prefs.setString(
                            'Batch Name', selectedBatchNo.toString());

                        late final String? CenterSaved;
                        late final String? CourseTypeSaved;
                        late final String? CourseSaved;
                        late final String? FeeSaved;
                        late final String? BatchSaved;

                        CenterSaved = await prefs.getString('Center');
                        CourseTypeSaved = await prefs.getString('Course Type');
                        CourseSaved = await prefs.getString('Course Name');
                        FeeSaved = await prefs.getString('Fee');
                        BatchSaved = await prefs.getString('Batch');
                        print(CenterSaved);
                        print(CourseTypeSaved);
                        print(CourseSaved);
                        print(FeeSaved);
                        print(BatchSaved);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPersonalInformationUI()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Fill up all required fields'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    child: const Text('Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  bool RegistrationCheck() {
    return _centerID != null &&
        _CourseTypecontroller.text.isNotEmpty &&
        _courseID != null &&
        _Fee != null &&
        _batchID != null &&
        _centerID != '' &&
        _courseID != '' &&
        _Fee != '' &&
        _batchID != '';
  }
}
