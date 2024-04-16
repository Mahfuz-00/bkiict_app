
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
          'Long Courses',
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
      body: TabBarView(
        controller: _tabController,
        children: [
          //Ongoing Courses
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Container(
                height: screenHeight+205,
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
                height: screenHeight+205,
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
