import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Connection Checker/internetconnectioncheck.dart';
import '../../../Data/Data Sources/API Service (Registration)/apiServiceRegistration.dart';
import 'paymentconfirmation.dart';

class RegistrationApplicationReviewUI extends StatefulWidget {
  final bool shouldRefresh;
  const RegistrationApplicationReviewUI({Key? key, this.shouldRefresh = false})
      : super(key: key);

  @override
  State<RegistrationApplicationReviewUI> createState() =>
      _RegistrationApplicationReviewUIState();
}

class _RegistrationApplicationReviewUIState
    extends State<RegistrationApplicationReviewUI>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String Imagepath = "";
  late String CertificateImagepath = "";
  late String CenterName = "";
  late String courseType = "";
  late String course = "";
  late String fee = "";
  late String batch = "";
  late String CenterID = "";
  late String courseID = "";
  late String batchID = "";
  late String fullName = "";
  late String email = "";
  late String mobileNumber = "";
  late String dateOfBirth = "";
  late String gender = "";
  late String educationQualification = "";
  late String discipline = "";
  late String subject = "";
  late String passingYear = "";
  late String institute = "";
  late String result = "";
  bool _pageLoading = true;
  bool _isFetched = false;
  bool buttonloading = false;

  Future<void> getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Imagepath = prefs.getString('image_path') ?? '';
    CenterID = prefs.getString('Center') ?? '';
    CenterName = prefs.getString('Center Name') ?? '';
    courseType = prefs.getString('Course Type') ?? '';
    courseID = prefs.getString('Course Name') ?? '';
    course = prefs.getString('Course_Name') ?? '';
    fee = prefs.getString('Fee') ?? '';
    batchID = prefs.getString('Batch') ?? '';
    batch = prefs.getString('Batch Name') ?? '';
    fullName = prefs.getString('full_name') ?? '';
    email = prefs.getString('email') ?? '';
    mobileNumber = prefs.getString('phone') ?? '';
    dateOfBirth = prefs.getString('date_of_birth') ?? '';
    gender = prefs.getString('gender') ?? '';
    educationQualification = prefs.getString('qualification') ?? '';
    discipline = prefs.getString('decipline') ?? '';
    subject = prefs.getString('subject_name') ?? '';
    passingYear = prefs.getString('passing_year') ?? '';
    institute = prefs.getString('institute') ?? '';
    result = prefs.getString('result') ?? '';
    CertificateImagepath = prefs.getString('certificate_image_path') ?? '';
    // Print the data for verification
    printData();
  }

  void printData() {
    print('Image Path: $Imagepath');
    print('Center Name: $CenterName');
    print('Course Type: $courseType');
    print('Course: $course');
    print('Fee: $fee');
    print('Batch: $batch');
    print('Full Name: $fullName');
    print('Email: $email');
    print('Mobile Number: $mobileNumber');
    print('Date of Birth: $dateOfBirth');
    print('Gender: $gender');
    print('Education Qualification: $educationQualification');
    print('Discipline: $discipline');
    print('Subject: $subject');
    print('Passing Year: $passingYear');
    print('Institute: $institute');
    print('Result: $result');
    print('Certificate Image Path: $CertificateImagepath');
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
                    fontSize: 16,
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
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                    color: Color.fromRGBO(143, 150, 158, 1),
                    fontSize: 16,
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

  Map<String, String> _formData = {};

  @override
  void initState() {
    super.initState();
    getDataFromSharedPreferences();
    Future.delayed(Duration(seconds: 5), () {
      if (widget.shouldRefresh) {
        // Refresh logic here, e.g., fetch data again
        print('Page Loading Done!!');
        setState(() {
          print('Page Loading');
          _pageLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  _pageLoading
        ? Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Show circular loading indicator while waiting
        child: CircularProgressIndicator(),
      ),
    )
        : InternetConnectionChecker(
      child: Scaffold(
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
            'BKIICT',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'default',
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Container(
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Please Review and Confirm Your Application',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.17,
                    decoration: BoxDecoration(
                      /*shape: BoxShape.square,*/
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(Imagepath)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Center(
                    child: Container(
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            width: 1,
                          )),
                      child: Column(
                        children: [
                          Text('Information Details',
                          style: TextStyle(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            letterSpacing: 1.2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),),
                          SizedBox(height: 10,),
                          Divider(),
                          Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  _buildRow('Center Name', CenterName),
                                  _buildRow(
                                      'Course Type', courseType),
                                  _buildRow('Course Name', course),
                                  _buildRow('Course Fee', '$fee TK'),
                                  _buildRow('Batch No', batchID),
                                  _buildRow('Full Name', fullName),
                                  _buildRow('Email', email),
                                  _buildRow('Mobile Number', mobileNumber),
                                  _buildRow('Date of Birth', dateOfBirth),
                                  _buildRow('Gender', gender),
                                ],
                              )),
                        ],
                      ),
                )),
                SizedBox(height: 15,),
                Center(
                    child: Container(
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            width: 1,
                          )),
                      child: Column(
                        children: [
                          Text('Education Details',
                            style: TextStyle(
                              color: Color.fromRGBO(134, 188, 66, 1),
                              letterSpacing: 1.2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),),
                          SizedBox(height: 10,),
                          Divider(),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                _buildRow('Education Qualification',
                                    educationQualification),
                                if(educationQualification == 'SSC or Equivalent'  || educationQualification == 'HSC or Equivalent') ...[
                                  _buildRow('Decipine', discipline),
                                ],
                                if(educationQualification == 'BSc or Equivalent'  || educationQualification == 'Diploma or Equivalent') ...[
                                  _buildRow('Subject', subject),
                                ],
                                _buildRow('Passing Year', passingYear),
                                _buildRow('Institute', institute),
                                _buildRow('Result', result),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),

                SizedBox(height: 15,),
                Center(
                    child: Container(
                      width: screenWidth * 0.85,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            width: 1,
                          )),
                      child: Column(
                        children: [
                          Text('Certificate',
                            style: TextStyle(
                              color: Color.fromRGBO(134, 188, 66, 1),
                              letterSpacing: 1.2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'default',
                            ),),
                          SizedBox(height: 10,),
                          Divider(),
                          Center(
                            child: Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.17,
                              decoration: BoxDecoration(
                                /*shape: BoxShape.square,*/
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(CertificateImagepath)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 25,),
                Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
                        fixedSize: Size(MediaQuery.of(context).size.width* 0.85, MediaQuery.of(context).size.height * 0.08),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          buttonloading = true;
                        });
                        final apiService =
                        await RegistrationAPIService.create();

                        final registrationSuccessful = await apiService
                            .sendRegistrationDataFromSharedPreferences(
                            File(Imagepath), File(CertificateImagepath));
                        if (registrationSuccessful != null &&
                            registrationSuccessful['status'] == true) {
                          SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                          int examRegistrationId =
                          registrationSuccessful['records']
                          ['exam_registration_id'];
                          prefs.setInt(
                              'exam_registration_id', examRegistrationId);
                          print(
                              'Saved exam registration ID: $examRegistrationId');
                          // If registration was successful, navigate to the next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const PaymentConfirmationUI()),
                          );
                        } else {
                          setState(() {
                            buttonloading = false;
                          });
                          // If registration failed, show a snackbar indicating the failure
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to submit registration data. Please try again.'),
                              duration: Duration(
                                  seconds:
                                  3), // Adjust the duration as needed
                            ),
                          );
                        }
                      },
                      child: buttonloading
                          ? CircularProgressIndicator()
                          : const Text('Procced',
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
          ),
        )),
      ),
    );
  }

}
