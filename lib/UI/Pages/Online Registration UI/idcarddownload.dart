import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The [IDCardDownloadUI] class represents a screen where users can download
/// their ID card after completing payment. It contains a button that
/// navigates back to the previous screen and displays ID card information
/// such as center name, course name, batch number, user name, and mobile
/// number. The UI is structured to provide a clear and user-friendly
/// experience for downloading the ID card.
///
/// The [IDCardDownloadUI] widget uses a [Scaffold] to provide basic
/// visual structure, including an [AppBar] and a [SingleChildScrollView]
/// for scrolling through the content.
///
/// Variables:
/// - [screenWidth]: The width of the current screen.
/// - [screenHeight]: The height of the current screen.
/// - [_scaffoldKey]: A key to uniquely identify the scaffold state.
class IDCardDownloadUI extends StatefulWidget {
  const IDCardDownloadUI({super.key});

  @override
  State<IDCardDownloadUI> createState() => _IDCardDownloadUIState();
}

class _IDCardDownloadUIState extends State<IDCardDownloadUI> with SingleTickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
          'ID Card',
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
                  child: Text(
                    'Congratulations, Your Payment is Completed, \n You can download your id card',
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
                  height: 35,
                ),
                Container(
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
                      Text('ID Card',
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color.fromRGBO(143, 150, 158, 1),
                            width: 1,
                          ),
                        ),
                        child: Icon(Icons.person,
                        size: 80,),
                      ),
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          Text('Information Details',
                          style: TextStyle(
                            color: Color.fromRGBO(134, 188, 66, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'default',
                          ),),
                          Divider(height: 10,),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Center Name',
                                  style: TextStyle(
                                    color: Color.fromRGBO(143, 150, 158, 1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'default',
                                  ),),
                                  Text('Course Name',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('Batch No',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('Name',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('Mobile No',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('BKIICT - Dhaka',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('Web Development (Long)',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('87',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('Md. Samiul Islam',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                  Text('01234567890',
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 150, 158, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'default',
                                    ),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IDCardDownloadUI()));
                      },
                      child: const Text('Download',
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
        ),
      ),
    );
  }
}
