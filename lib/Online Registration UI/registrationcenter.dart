
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
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          'Registration Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'default',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_rounded, color: Colors.white,),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(134, 188, 66, 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 35,
                    ),
                    radius: 30,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashboard())); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              title: Text('Information',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',)),
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Information()));*/
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Login())); // Close the drawer
              },
            ),
            Divider(),
          ],
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
      bottomNavigationBar: Container(
        height: screenHeight * 0.08,
        color: const Color.fromRGBO(134, 188, 66, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard()));
              },
              child: Container(
                width: screenWidth / 3,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'default',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchUser()));*/
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
                width: screenWidth / 3,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'default',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Information()));*/
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    )),
                width: screenWidth / 3,
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'default',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
