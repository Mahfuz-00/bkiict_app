
import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:bkiict_app/Online%20Registration%20UI/registrationpersonalinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';
import '../Template Models/dropdownfield.dart';
import '../Template Models/dropdownoptionsfield.dart';

class RegistrationCenter extends StatefulWidget {
  const RegistrationCenter({super.key});

  @override
  State<RegistrationCenter> createState() => _RegistrationCenterState();
}

class _RegistrationCenterState extends State<RegistrationCenter> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String? selectedCenter;
  String? selectedCourseType;
  String? selectedCourse;
  String? selectedBatchNo;
  String? selectedTutionFee;

  final Map<String, List<String>> courseTypeOptions = {
    'BKIICT Dhaka 1': ['Short', 'Long'],
    'BKIICT Dhaka 2': ['Short', 'Long'],
  };

  final Map<String, List<String>> courseOptions = {
    'Short': ['Web Development(Short)', 'App Development(Short)'],
    'Long': ['Web Development(Long)', 'App Development(Long)'],
    'Short': ['Web Development(Short)', 'App Development(Short)'],
    'Long': ['Web Development(Long)', 'App Development(Long)'],
  };

  final Map<String, List<String>> batchNoOptions = {
    'Web Development(Short)': ['12', '21'],
    'Web Development(Long)': ['34', '43'],
    'App Development(Short)': ['56', '65'],
    'App Development(Long)': ['78', '87'],
  };

  final Map<String, List<String>> tutionFeeOptions = {
    '12': ['3000'],
    '21': ['5000'],
    '34': ['2000'],
    '43': ['1000'],
    '56': ['600'],
    '65': ['2500'],
    '78': ['1500'],
    '87': ['2100','2000'],
  };

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
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.085,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedCenter,
                        items: courseTypeOptions.keys.map((String courseType) {
                          return DropdownMenuItem<String>(
                            value: courseType,
                            child: Text(courseType,
                              style: TextStyle(
                                color: Colors.black ,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'default',
                              ),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCenter = newValue;
                            selectedCourseType = null;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Center',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),border: InputBorder.none,),
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
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.085,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedCourseType,
                        items: courseOptions.keys.map((String course) {
                          return DropdownMenuItem<String>(
                            value: course,
                            child: Text(course,
                              style: TextStyle(
                                color: Colors.black ,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'default',
                              ),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCourseType = newValue;
                            selectedCourse = null;
                            if (selectedCourseType != null) {
                              courseOptions[selectedCourseType!];
                            } else {
                              [];
                            }
                          });
                        },
                        decoration: InputDecoration(labelText: 'Course Type',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),border: InputBorder.none,),
                      ),
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
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: screenWidth*0.9,
                        height: screenHeight*0.085,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedCourse,
                          items: selectedCourseType != null
                              ? courseOptions[selectedCourseType!]!.map((String course) {
                            return DropdownMenuItem<String>(
                              value: course,
                              child: Text(
                                course,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'default',
                                ),
                              ),
                            );
                          }).toList()
                              : [],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCourse = newValue;
                              selectedBatchNo = null;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Course',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(143, 150, 158, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),border: InputBorder.none,),
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
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: screenWidth*0.9,
                        height: screenHeight*0.085,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: selectedBatchNo,
                          items:  selectedCourse != null
                              ? batchNoOptions[selectedCourse!]!.map((String batch) {
                            return DropdownMenuItem<String>(
                              value: batch,
                              child: Text(batch,
                                style: TextStyle(
                                  color: Colors.black ,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  fontFamily: 'default',
                                ),),
                            );
                          }).toList(): [],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedBatchNo = newValue;
                              //selectedTutionFee = null;
                              selectedTutionFee = tutionFeeOptions[selectedBatchNo!]?.first;
                            });
                          },
                          decoration: InputDecoration(labelText: 'Batch No',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(143, 150, 158, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),
                            border: InputBorder.none,),
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
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: screenWidth*0.9,
                      height: screenHeight*0.085,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20,),
                        child: Text(
                          selectedTutionFee ?? 'Tution Fee',
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistrationPersonalInformation()));
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
