
import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:bkiict_app/Online%20Registration%20UI/registrationapplicationreview.dart';
import 'package:bkiict_app/Online%20Registration%20UI/registrationpersonalinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';
import '../Template Models/dropdownfield.dart';

class RegistrationAcademicInformation extends StatefulWidget {
  const RegistrationAcademicInformation({super.key});

  @override
  State<RegistrationAcademicInformation> createState() => _RegistrationAcademicInformationState();
}

class _RegistrationAcademicInformationState extends State<RegistrationAcademicInformation> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<DropdownMenuItem<String>> education = [
    DropdownMenuItem(child: Text("SSC or Equivalent"), value: "SSC or Equivalent"),
    DropdownMenuItem(child: Text("HSC or Equivalent"), value: "SSC or Equivalent"),
    DropdownMenuItem(child: Text("BSc or Equivalent"), value: "BSc or Equivalent"),
  ];

  List<DropdownMenuItem<String>> decipline = [
    DropdownMenuItem(child: Text("Science"), value: "Science"),
    DropdownMenuItem(child: Text("Commerce"), value: "Commerce"),
    DropdownMenuItem(child: Text("Arts"), value: "Arts"),
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
        scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Academic Information(s)',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),),
                  ),
                  const SizedBox(height: 25),
                  Text('Your Education Qualification',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  DropdownFormField(hintText: 'Education Qualification', dropdownItems: education,),
                  const SizedBox(height: 5),
                  Text('Decipline',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  DropdownFormField(hintText: 'Decipline', dropdownItems: decipline,),
                  const SizedBox(height: 5),
                  Text('Subject',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 70,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Subject Name',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Passing Year',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 70,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Passing Year',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Institute',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 70,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Institute',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Result',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 70,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Result',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Certificate',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 70,
                    child: TextFormField(
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Certification',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){},
                          child: Container(
                              margin: EdgeInsets.only(right: 2),
                              padding: EdgeInsets.all(3),
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(2),
                                  bottomRight: Radius.circular(2),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(Icons.file_upload,
                                    color: Color.fromRGBO(143, 150, 158, 1),),
                                  Text('Upload',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),)
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(MediaQuery.of(context).size.width* 0.4, MediaQuery.of(context).size.height * 0.08),
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
                            child: const Text('Back',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'default',
                                )),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                              fixedSize: Size(MediaQuery.of(context).size.width* 0.4, MediaQuery.of(context).size.height * 0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegistrationApplicationReview()));
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
