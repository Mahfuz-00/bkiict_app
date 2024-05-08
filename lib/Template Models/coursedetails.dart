import 'package:bkiict_app/Course%20Dashboard%20UI/coursedashboard.dart';
import 'package:bkiict_app/Template%20Models/courseinfo.dart';
import 'package:flutter/material.dart';

import '../Dashboard UI/dashboardUI.dart';

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
        leadingWidth: 40,
        titleSpacing: 10,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          'Course Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'default',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${course.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'default',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text('Course Overview/Course Objective',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Understand the fundamentals of programming\nMaster mobile app development\nLearn advanced data structures and algorithms\nBuild scalable web applications\nGain expertise in cloud computing\nDevelop problem-solving skills\nExplore artificial intelligence and machine learning\nUnderstand cybersecurity concepts\nEnhance knowledge in software engineering principles\nImprove programming efficiency and productivity\n',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              Text('Requirement',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'HSC or Equivalent',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Course Project',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'N/A',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Used Tools',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Microsoft Outlook 2017',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Course Outline',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Week 1: Fundamentals of Data Science\n\t\t\tIntroduction to data science\n\t\t\tBasics of statistics and probability\n\t\t\tData types and data structures\n\t\t\tData cleaning and preprocessing\n\n'
                  'Week 2: Exploratory Data Analysis (EDA)\n\t\t\tUnderstanding data distributions\n\t\t\tData visualization techniques\n\t\t\tExploring relationships between variables\nHandling missing data and outliers\n\n'
                  'Week 3: Data Wrangling\n\t\t\tData manipulation with pandas\n\t\t\tData aggregation and grouping\n\t\t\tFeature engineering techniques\n\t\t\tWorking with time-series data\n\n'
                  'Week 4: Machine Learning Fundamentals\n\t\t\tIntroduction to machine learning\n\t\t\tSupervised learning algorithms (e.g., regression, classification)\n\t\t\tUnsupervised learning algorithms (e.g., clustering, dimensionality reduction)\n\t\t\tModel evaluation and validation techniques\n\n'
                  'Week 5: Advanced Topics in Machine Learning\n\t\t\tEnsemble learning methods (e.g., random forests, gradient boosting)\n\t\t\tNeural networks and deep learning basics\n\t\t\tModel tuning and hyperparameter optimization\n\t\t\tHandling imbalanced data and overfitting\n\n'
                  'Week 6: Real-world Applications and Case Studies\n\t\t\tApplication of data science in various industries (e.g., finance, healthcare, marketing)\n\t\t\tCase studies and projects demonstrating end-to-end data science workflows\n\t\t\tBest practices for deploying and maintaining machine learning models\n\t\t\tEthical considerations in data science\n\n'
                  'By the end of the course, students will have gained a solid understanding of key data science concepts, tools, and techniques, enabling them to tackle real-world data problems effectively.\n',
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'default',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Course Summary',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'default',
                              ),
                            ),
                          )),
                      Container(
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Course Type',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Course Duration',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Course Hour(s)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Classes',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Tution Fee',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Batch',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Registration Deadline',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Class Shift',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('Class Start',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Short Course',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.duration}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('90',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.classes}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.coursefee}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.batchno}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.registrationbefore}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.classshift}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                                Text('${course.startdate}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontFamily: 'default',
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Course Schedule',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'default',
                              ),
                            ),
                          )),
                      Container(
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Class Time',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontFamily: 'default',
                                )),
                            Spacer(),
                            Text('Afternoon 3:30 PM',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(143, 150, 158, 1),
                                  fontFamily: 'default',
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Course Cordinator',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'default',
                              ),
                            ),
                          )),
                      Container(
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Center(
                          child: Text('Md. Mahmudul Hasan Munna',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(143, 150, 158, 1),
                                fontFamily: 'default',
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Material(
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Course Instructor(s)',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'default',
                              ),
                            ),
                          )),
                      Container(
                        width: screenWidth * 0.9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  Text('Cordinator A',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(143, 150, 158, 1),
                                        fontFamily: 'default',
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  Text('Cordinator B',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(143, 150, 158, 1),
                                        fontFamily: 'default',
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
