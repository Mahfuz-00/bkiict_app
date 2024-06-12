import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  Center(
                    child: Text('${course.courseName}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontFamily: 'default',
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  _buildRow('Batch No', course.batchNo),
                 _buildRow('Course Fee', '${course.courseFee} TK'),
                  _buildRow('Classes', course.classes),
                  _buildRow('Duration', course.duration),
                  _buildRowTime('Class Starts', course.classStart),
                  _buildRow('Class Shift', course.shift),
                  _buildRow('Registration Before', course.regDeadline),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseDetails(courseId: course.courseId, shouldRefresh: true, batch: int.parse(course.batchNo,))));
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

  Widget _buildRowTime(String label, String value) {
    //String formattedDateTime = DateFormat('dd/MM/yyyy hh:mm a').format(value); // 'a' for AM/PM

    // Parse the date and time string
    DateTime dateTime = DateFormat('dd-MM-yyyy').parse(value);

    // Format the date and time
    String formattedDateTime = DateFormat('dd-MM-yyyy').format(dateTime);
    DateTime date = DateTime.parse(value);
    DateFormat dateFormat = DateFormat.yMMMMd('en_US');
    DateFormat timeFormat = DateFormat.jm();
    String formattedDate = dateFormat.format(date);
    String formattedTime = timeFormat.format(date);
    //String formattedDateTime = '$formattedDate, $formattedTime';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ":",
            style: TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            formattedDate, // Format date as DD/MM/YYYY
            style: TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 18,
              height: 1.6,
              letterSpacing: 1.3,
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            ":",
            style: TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    height: 1.6,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
