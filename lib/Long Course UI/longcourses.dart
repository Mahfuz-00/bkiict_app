
import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';
import '../Template Models/coursecard.dart';
import '../Template Models/courseinfo.dart';

class LongCourses extends StatefulWidget {
  const LongCourses({super.key});

  @override
  State<LongCourses> createState() => _LongCoursesState();
}

class _LongCoursesState extends State<LongCourses> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          'Long Courses',
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
              Divider(height: 0.5,),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    SizedBox(height: 20,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    SizedBox(height: 20,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
                    CourseCard(
                      course: Course(
                        name: 'Online Application',
                        batchno: 39,
                        coursefee: 30000,
                        classes: 40,
                        duration: '4 Months',
                        startdate: '22 April 2024',
                        classshift: 'Afternoon',
                        registrationbefore: '10 April 2024',
                      ),
                    ),SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
