import 'package:bkiict_app/Dashboard%20UI/dashboardUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';

class FeedbackUI extends StatefulWidget {
  const FeedbackUI({super.key});

  @override
  State<FeedbackUI> createState() => _FeedbackUIState();
}

class _FeedbackUIState extends State<FeedbackUI> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134,188,66, 1),
        titleSpacing: 5,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: const Text(
          'Feedback',
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
                        builder: (context) => const FeedbackUI())); // Close the drawer
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Center(
                        child: Text('Some of your Feedback',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'default',
                        ),
                        ),
                      ),
                  SizedBox(height: 25,),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: screenWidth*0.9,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Text('Md. Abdus Salam',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),
                          ),
                          Divider(),
                          Text('First of all i would like to thanks my creator Allah for giving me chance to comment about BCC. I would like to thanks really from my heart to BKIICT for providing different types of ICT courses in the light of Government policy  under BCC. I think, its a really vital and respectable work for BKIICT under BCC. Don\'t worry and carry on BKIICT with respect. I always respect to your work by which an illiterate person of ICT can easily learn about ICT. Thanking You, Md.Abdus Salam',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'default',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Text('Feedback Box',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(height: 15,),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Form(
                        child: Container(
                          width: screenWidth*0.95,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  //width: screenWidth*0.8,
                                  height: screenHeight*0.05,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(223,240,216, 1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(214,233,198, 1),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Please fill up this form to send us your feedback.',
                                      style: TextStyle(
                                        color: Color.fromRGBO(60,118,61, 1),
                                        fontSize: 15,
                                        fontFamily: 'default',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height:10),
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
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                  ),
                                ),
                              ),
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
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                  ),
                                ),
                              ),
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
                                    labelText: 'Your Comments (Max 800 Words)',
                                    labelStyle: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'default',
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 350,
                                      height: 100,
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
                                          labelText: 'Capcha Image',
                                          labelStyle: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'default',
                                          ),
                                          alignLabelWithHint: true,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 105),
                                          border:  const OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(Radius.circular(5))
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 200,
                                    height: 70,
                                    child: Center(
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
                                          labelText: 'Capcha Text',
                                          labelStyle: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'default',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Padding(
                                    padding: EdgeInsets.zero,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(68, 157, 68, 1),
                                          fixedSize: Size(140, 55),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {
                                          /* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const FeedbackUI()));*/
                                        },
                                        child: Text('Try Another Image',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'default',
                                            )),
                                      ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(68, 157, 68, 1),
                                      fixedSize: Size(MediaQuery.of(context).size.width* 0.8, MediaQuery.of(context).size.height * 0.08),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                     /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const FeedbackUI()));*/
                                    },
                                    child: const Text('Submit Feedback',
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
                    )),
                  )
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
