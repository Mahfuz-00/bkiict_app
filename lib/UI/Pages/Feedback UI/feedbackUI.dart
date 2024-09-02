import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Widgets/feedbackbodycontainer.dart';
import '../Dashboard UI/dashboardUI.dart';
import '../Login UI/loginUI.dart';

class FeedbackUI extends StatefulWidget {
  const FeedbackUI({super.key});

  @override
  State<FeedbackUI> createState() => _FeedbackUIState();
}

class _FeedbackUIState extends State<FeedbackUI>
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
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
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
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
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
                    fontFamily: 'default',
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Dashboard())); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              title: Text('Information',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
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
                    fontFamily: 'default',
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Login())); // Close the drawer
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
        child:
            BodyContainer(screenWidth: screenWidth, screenHeight: screenHeight),
      )),
    );
  }
}
