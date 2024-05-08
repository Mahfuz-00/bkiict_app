import 'dart:io';
import 'dart:async';

import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:bkiict_app/Login%20UI/loginUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Profile extends StatefulWidget {
  final bool shouldRefresh;

  const Profile({Key? key, this.shouldRefresh = false})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalfromkey = GlobalKey<FormState>();
  bool _isLoading = false;
  late final String name;
  bool isloaded = false;
  bool _pageLoading = true;


  @override
  void initState() {
    super.initState();
    print('initState called');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
        canPop: true,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          //resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
            title: Text('Profile Overview',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'default',
              ),),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout, color: Colors.white,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
              ),
            ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Container(
                  child: Divider(color: Colors.white, height: 2,),
                ),
              )
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                color: const Color.fromRGBO(134, 188, 66, 1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Column(children: [
                            Stack(
                              children: [
                                Container(
                                  width: 120, // Adjust width as needed
                                  height: 120, // Adjust height as needed
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  color: Colors.white,

                                  /*  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://bcc.touchandsolve.com' +
                                              userProfile!.photo),
                                    ),*/
                                  ),
                                  child: Icon(Icons.person, size: 80,),
                                ),
                               /* Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    //padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _showImagePicker();
                                      },
                                      alignment: Alignment.center,
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Student Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'default',
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Institute',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'default',
                              ),
                            ),
                            const SizedBox(height: 50),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Container(
                                width: screenWidth,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Column(
                                  children: [
                                    _buildDataCouple(Icons.person, 'Name',
                                        'Student Name'),
                                    Divider(),
                                    _buildDataCouple(
                                        Icons.supervised_user_circle_rounded,
                                        'Mobile',
                                        '01234567890'),
                                    Divider(),
                                    _buildDataCouple(Icons.mail, 'Email',
                                        'abcd@gmail.com'),
                                    //Divider(),
                                    /*GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PasswordChange(),));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 9,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Change Password',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        height: 1.6,
                                                        letterSpacing: 1.3,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontFamily: 'default',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )*/
                                  ],
                                ),
                              ),
                            )
                          ])),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.8,
                                  MediaQuery.of(context).size.height *
                                      0.08),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                    child: Icon(
                                      Icons.home,
                                      color:const Color.fromRGBO(134, 188, 66, 1),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                const Text('Back to Home',
                                    style: TextStyle(
                                      color: const Color.fromRGBO(134, 188, 66, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }


  Widget _buildDataCouple(IconData icon, String label, String value) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(icon, size: 25),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        height: 1.6,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 35,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        height: 1.6,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
