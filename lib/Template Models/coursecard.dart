import 'package:flutter/material.dart';

import 'coursedetails.dart';
import 'courseinfo.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard(
      {Key? key,
      required this.course,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${course.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontFamily: 'default',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Batch No: ${course.batchno}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Course Fee: ${course.coursefee} TK',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Classes: ${course.classes}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Duration: ${course.duration}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Class Starts: ${course.startdate}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Class Shoft: ${course.classshift}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                  Text('Registration Before: ${course.registrationbefore}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontFamily: 'default',
                      )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetails(course: course,)));
              },
              child: Container(
                  width: screenWidth * 0.9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Course Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(134, 188, 66, 1),
                        fontFamily: 'default',
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
