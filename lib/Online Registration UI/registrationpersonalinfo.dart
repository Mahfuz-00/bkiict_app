
import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:bkiict_app/Online%20Registration%20UI/registrationacademicinfo.dart';
import 'package:bkiict_app/Online%20Registration%20UI/registrationcenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Login UI/loginUI.dart';
import '../Template Models/dropdownfield.dart';

class RegistrationPersonalInformation extends StatefulWidget {
  const RegistrationPersonalInformation({super.key});

  @override
  State<RegistrationPersonalInformation> createState() => _RegistrationPersonalInformationState();
}

class _RegistrationPersonalInformationState extends State<RegistrationPersonalInformation> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _Datecontroller= TextEditingController();

  List<DropdownMenuItem<String>> gender = [
    DropdownMenuItem(child: Text("Male"), value: "Male"),
    DropdownMenuItem(child: Text("Female"), value: "Female"),
  ];

  @override
  void dispose() {
    _Datecontroller.dispose();
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
                    child: Text('Personal Information(s)',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),),
                  ),
                  const SizedBox(height: 25),
                  Text('Your Full Name',
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
                        labelText: 'Full Name',
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
                  Text('Your Email Address',
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
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                      ),
                    ),
                  ),const SizedBox(height: 5),
                  Text('Your Mobile Number',
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
                        labelText: 'Mobile No',
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
                  Text('Your Date of Birth',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 350,
                    height: 60,
                    child: TextFormField(
                      controller: _Datecontroller,
                      readOnly: true,
                      enableInteractiveSelection: false,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'default',
                        ),
                        contentPadding: EdgeInsets.all(10),
                        //floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            ).then((selectedDate) {
                              if (selectedDate != null) {
                                final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                                _Datecontroller.text = formattedDate;
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0), // Adjust the padding as needed
                            child: Icon(Icons.calendar_today_outlined, size: 30,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Your Gender',
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  SizedBox(height: 5,),
                  DropdownFormField(hintText: 'Gender', dropdownItems: gender,),
                  const SizedBox(height: 15),
                  Text('Upload Your Profile Picture',
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
                        labelText: 'Your Photo',
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
                  SizedBox(height: 20,),
                  Row(
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
                                    builder: (context) => const RegistrationCenter()));
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
                                    builder: (context) => const RegistrationAcademicInformation()));
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
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
