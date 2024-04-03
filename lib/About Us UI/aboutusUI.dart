import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin{
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
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          'About Us',
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
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Organization Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
                        builder: (context) => const AboutUs())); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              title: Text('Report',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',)),
              onTap: () {
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BCCReport()));*/
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Introduction:',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),),
                  Text('One of the activities of Bangladesh Computer Council (BCC) is to develop trained manpower in the field of ICT through ICT training. In the year of 2005, with the technical and financial assistance of government of Korea through Korean International Cooperation Agency (KOICA). Bangladesh Computer Council established “Bangladesh Korea Institute of Information and Communication Technology (BKIICT)”, an international-standard ICT training institute, housed on the ground floor of BCC Bhaban at Sher-e-Bangla Nagar in the capital.\n\n'
                    'Bangladesh Korea Institute of Information and Communication technology (BKIICT) is a newly established modern ICT Institute fully equipped h with State-of-art technology for industry standard Human resources Development in ICT to meet the National and International market demand.\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'default',
                    ),),
                  Text('What we do?\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('To perform as a centre of excellence for Human Resource Development in ICT to meet the challenge of 21st Century.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('To conduct Standard Certification courses for the development of professional skills in ICT.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('To provide training on Diploma and Post Graduate Diploma in ICT.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('To conduct customized courses for Government officials to make them ICT efficient.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Text('BCC aims at under privileged section of the society, physically challenged people and women to include them in the main stream of the development by making ICT skilled. Presently BCC runs following programs to fulfill that objective\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'default',
                    ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Special training course for physically challenged people and Slum Dwellers.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Special training courses for women.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Additionally, we provide recruitment service for Aptitude Test of ICT candidate of Bangladesh Public Service Commission (BPSC) and Government organization/Department.\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Text('Facilities at BKIICT:\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),),
                  Text('(i)There are 08(Eight) well-equipped state of the art training labs at BCC, each with\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'default',
                    ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('20 seats\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('High speed internet connection\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Fully air conditioned\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Multimedia presentation system\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Canteen with well decorate and Standard facilities for Participants. \n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Text('(ii) Special lab for\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'default',
                    ),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Multimedia\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text('Network\n',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontFamily: 'default',
                          ),),
                      ),
                    ],
                  ),
                  Text('(iii) Pool of resource persons expert in respective fields.\n',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: 'default',
                    ),),
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
