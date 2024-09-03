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

class RegistrationCenterUI extends StatefulWidget {
  const RegistrationCenterUI({super.key});

  @override
  State<RegistrationCenterUI> createState() => _RegistrationCenterUIState();
}

class _RegistrationCenterUIState extends State<RegistrationCenterUI> with SingleTickerProviderStateMixin{
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

      // Fetch dashboard data
      final Map<String, dynamic> dashboardData =
      await apiService.fetchCenterItems();
      if (dashboardData == null || dashboardData.isEmpty) {
        // No data available or an error occurred
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        // No records available
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
      // Handle error as needed
    }
  }

  Future<void> handleCenters(List<dynamic> centerData) async {
    List<CenterOption> fetchedCenters = [];
    try {
      for (dynamic center in centerData) { // Iterate over the list directly
        CenterOption option = CenterOption(
          id: center['id'],
          name: center['name'],
        );
        fetchedCenters.add(option);
        print('Center Name: ${option.name}');
        // Further processing if needed
      }
      setState(() {
        isLoadingCenters = false;
        centers = fetchedCenters;
      });
    } catch (e) {
      print('Error handling centers: $e');
      // Handle error
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

      // Fetch dashboard data
      final Map<String, dynamic> dashboardData =
      await apiService.fetchCourseItems(Id: int.parse(centerId), coursetype: CourseType);
      if (dashboardData == null || dashboardData.isEmpty) {
        // No data available or an error occurred
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        // No records available
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
      // Handle error as needed
    }
  }


  Future<void> handleCourse(List<dynamic> courseData) async {
    List<Course> fetchedCourses = [];
    try {
      for (dynamic course in courseData) { // Iterate over the list directly
        Course option = Course(
          id: course['id'],
          name: course['name'],
          fee: course['fee'],
        );
        fetchedCourses.add(option);
        print('Course Name: ${option.name}');
        // Further processing if needed
      }
      setState(() {
        isLoadingCourse = false;
        courses = fetchedCourses;
      });
    } catch (e) {
      print('Error handling centers: $e');
      // Handle error
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

      // Fetch dashboard data
      final Map<String, dynamic> dashboardData =
      await apiService.fetchBatchItems(Id: int.parse(courseId));
      if (dashboardData == null || dashboardData.isEmpty) {
        // No data available or an error occurred
        print(
            'No data available or error occurred while fetching dashboard data');
        return;
      }

      final List<dynamic> records = dashboardData['records'];
      if (records == null || records.isEmpty) {
        // No records available
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
      // Handle error as needed
    }
  }


  Future<void> handleBatch(List<dynamic> batchData) async {
    List<BatchNo> fetchedBatches = [];
    try {
      for (dynamic course in batchData) { // Iterate over the list directly
        BatchNo option = BatchNo(
          id: course['id'],
         number: course['batch_number'],
          name: course['name'],
        );
        fetchedBatches.add(option);
        print('Batch Number: ${option.number}');
        // Further processing if needed
      }
      setState(() {
        isLoadingBatch = false;
        batches = fetchedBatches;
      });
    } catch (e) {
      print('Error handling centers: $e');
      // Handle error
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
  //String? selectedTutionFee;

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
                      child: Text('Register here to learn creative skill',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),),
                    ),
                  SizedBox(height: 15,),
                  Text('Select a Center',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),),
                  SizedBox(height: 5,),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.075,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Stack(
                        children: [
                          if (isLoadingCenters)...[
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
                                // Reset other selected values if needed
                                selectedCenterValue = newValue!;
                                // Further logic if needed
                              });
                              if (newValue != null) {
                                CenterOption selectedCenterObject = centers.firstWhere(
                                      (type) => type.name == newValue,
                                );
                                if (selectedCenterObject != null) {
                                  //It Takes ID Int
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
                  SizedBox(height: 15,),
                  Text('Select a Course Type',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.075,
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
                            if(_centerID !=0 && _CourseTypecontroller.text.isNotEmpty){
                            fetchCourse(_centerID, _CourseTypecontroller.text);
                            }
                          }),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Select a Course',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: screenWidth*0.9,
                        height: screenHeight*0.075,
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
                                  // Reset other selected values if needed
                                  selectedCourse = newValue!;
                                  // Further logic if needed
                                });
                                if (newValue != null) {
                                  Course selectedCourseObject = courses.firstWhere(
                                        (type) => type.name == newValue,
                                  );
                                  if (selectedCourseObject != null) {
                                    _Fee = selectedCourseObject.fee.toString()+' TK';
                                    //It Takes ID Int
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
                  SizedBox(height: 15,),
                  Text('Course Free : ',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.075,
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
                  SizedBox(height: 15,),
                  Text('Select a Batch no',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        width: screenWidth*0.9,
                        height: screenHeight*0.075,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Stack(
                          children: [
                            if (isLoadingBatch)...[
                              Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(
                                  color: const Color.fromRGBO(134, 188, 66, 1),
                                ),
                              ),
                            ],
                            DropdownFormField(
                              hintText: 'Select Batch',
                              dropdownItems:
                              batches.map((batch) => '${batch.number} - ${batch.name}').toList(),
                              initialValue: selectedBatchNo,
                              onChanged: (newValue) {
                                setState(() {
                                  // Reset other selected values if needed
                                  selectedBatchNo = newValue!;
                                  // Further logic if needed
                                  print(newValue);
                                });
                                if (newValue != null) {
                                  BatchNo selectedBatchObject = batches.firstWhere(
                                        (type) => '${type.number} - ${type.name}' == newValue,
                                  );
                                  if (selectedBatchObject != null) {
                                    //It Takes ID Int
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
                  SizedBox(height: 25,),
                  Center(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                          fixedSize: Size(MediaQuery.of(context).size.width* 0.9, MediaQuery.of(context).size.height * 0.08),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () async {
                          if (_centerID != null &&
                              _CourseTypecontroller.text.isNotEmpty &&
                              _courseID != null && _Fee != null && _batchID != null && _centerID != '' &&
                              _courseID != '' && _Fee != '' &&
                              _batchID != '') {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setString('Center', _centerID);
                            await prefs.setString(
                                'Course Type', _CourseTypecontroller.text);
                            await prefs.setString('Course Name', _courseID);
                            await prefs.setString('Fee', _Fee);
                            await prefs.setString('Batch', _batchID);
                            await prefs.setString(
                                'Center Name', selectedCenterValue.toString());
                            await prefs.setString('Course_Name', selectedCourse.toString());
                            await prefs.setString('Batch Name', selectedBatchNo.toString());

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
          )
      ),
    );
  }
}
