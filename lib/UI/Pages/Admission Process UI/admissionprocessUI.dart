import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] that represents the user interface for the [AdmissionProcessUI].
///
/// This widget includes a [Scaffold] with an [AppBar] displaying the title
/// 'Admission Process' and a body that outlines the selection procedure
/// for BKIICT courses.
///
/// The class also includes the following private methods:
/// - [_buildBox(String text)]: Creates a container box displaying the
///   provided [text] for each step of the admission process.
/// - [_buildArrow()]: Returns an arrow icon indicating the flow of the
///   admission process.
class AdmissionProcessUI extends StatefulWidget {
  const AdmissionProcessUI({super.key});

  @override
  State<AdmissionProcessUI> createState() => _AdmissionProcessUIState();
}

class _AdmissionProcessUIState extends State<AdmissionProcessUI> with SingleTickerProviderStateMixin{
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
