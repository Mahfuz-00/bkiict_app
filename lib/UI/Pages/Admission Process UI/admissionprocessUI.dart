
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login UI/loginUI.dart';

class AdmissionProcess extends StatefulWidget {
  const AdmissionProcess({super.key});

  @override
  State<AdmissionProcess> createState() => _AdmissionProcessState();
}

class _AdmissionProcessState extends State<AdmissionProcess> with SingleTickerProviderStateMixin{
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          'Admission Process',
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
              height: screenHeight,
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Admission Process',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Selection Procedure',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(143, 150, 158, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text('To Enroll any BKIICT Courses. An Applicant must complete the online\'Application Form\'',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          _buildBox('COURSE OFFER'),
                          _buildArrow(),
                          _buildBox('ONLINE'),
                          _buildArrow(),
                          _buildBox('SHORTLISTING FOR PLACEMENT TEST'),
                          _buildArrow(),
                          _buildBox('PLACEMENT TEST'),
                          _buildArrow(),
                          _buildBox('FINAL SELECTION'),
                          _buildArrow(),
                          _buildBox('REGISTRATION / ADMISSION CLOSED'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _buildBox(String text) {
    return Container(
      height: 50,
      width: 350,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(143, 150, 158, 1)),
      ),
      child: Center(
        child: Text(text, style: TextStyle(
          color: Color.fromRGBO(143, 150, 158, 1),
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'default',
        ),),
      ),
    );
  }

  Widget _buildArrow() {
    return Icon(Icons.arrow_downward, color: Color.fromRGBO(143, 150, 158, 1),);
  }
}
