import 'package:flutter/material.dart';

/// A stateless widget that builds the main body of the feedback form.
///
/// This widget displays a header for feedback, a section for displaying
/// user feedback, and a form for submitting new feedback. It takes in
/// the screen width and height as parameters to manage layout dynamically.
///
/// The feedback form includes fields for the user's [Full Name],
/// [Mobile Number], [Email], and [Comments], along with a captcha input
/// section. A submit button allows users to send their feedback.
///
/// - Parameters:
///   - [screenWidth]: The width of the screen to adjust the layout.
///   - [screenHeight]: The height of the screen to adjust the layout.
class BodyContainer extends StatelessWidget {
  const BodyContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
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
                            width: 250,
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
                                fixedSize: Size(90, 55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {

                              },
                              child: Icon(Icons.refresh, color: Colors.white, size: 40),
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
    );
  }
}