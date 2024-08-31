import 'package:bkiict_app/UI/Widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Admission Process UI/admissionprocessUI.dart';
import '../Course Dashboard UI/coursedashboard.dart';
import '../Dashboard UI/dashboardUI.dart';
import '../Online Registration UI/registrationcenter.dart';
import '../Profile UI/profileUI.dart';

class Admission extends StatefulWidget {
  const Admission({super.key});

  @override
  State<Admission> createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          'Admission',
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
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          color: Colors.grey[100],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Admission & Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Text(
                    'You can Admission here or if you are new comer then register first',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      letterSpacing: 1.1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Buttons(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdmissionProcess()));
                  },
                  name: 'Admission Process'),
              SizedBox(
                height: 20,
              ),
              Buttons(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationCenter()));
                  },
                  name: 'Online Registration'),
            ],
          ),
        ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CourseDashboard()));
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
                      Icons.book,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Courses',
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              shouldRefresh: true,
                            )));
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
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Profile',
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
