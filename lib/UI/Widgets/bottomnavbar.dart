import 'package:flutter/material.dart';

import '../Pages/Dashboard UI/dashboardUI.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}