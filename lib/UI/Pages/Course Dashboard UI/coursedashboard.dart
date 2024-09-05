import 'package:bkiict_app/UI/Widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import '../../../Data/Data Sources/API Service (Download Course)/apiServiceCourseDownload.dart';
import '../Admission UI/admissiondashboardUI.dart';
import '../Customise Course UI/customisedcourses.dart';
import '../Dashboard UI/dashboardUI.dart';
import '../Long Course UI/longcourses.dart';
import '../Profile UI/profileUI.dart';
import '../Short Course UI/shortcourses.dart';

/// [CourseDashboardUI] is a widget that provides a dashboard for users to select various courses.
///
/// This widget includes the following key variables and actions:
/// - [scaffoldKey]: A key to manage the state of the Scaffold widget.
///
/// The widget features:
/// - An AppBar with a title and a back button.
/// - A body containing options to navigate to different course types:
///   - [Short Courses]
///   - [Long Courses]
///   - [Customised Courses]
///   - A button to [Download Courses Info].
/// - A bottom navigation bar with links to [Home], [Admission], and [Profile] sections.
///
/// The [generatePDF] method triggers the generation of a PDF document with course information.
class CourseDashboardUI extends StatefulWidget {
  const CourseDashboardUI({super.key});

  @override
  State<CourseDashboardUI> createState() => _CourseDashboardUIState();
}

class _CourseDashboardUIState extends State<CourseDashboardUI>
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
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          'Courses',
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
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenHeight * 0.9,
            color: Colors.grey[100],
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Select Your Course',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'default',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Text(
                      'One of the Activities of Bangladesh Computer Council (BCC) is to develop trained manpower in the field of ICT through ICT training',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(143, 150, 158, 1),
                        letterSpacing: 1.1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'default',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Buttons(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShortCoursesUI(
                                    shouldRefresh: true,
                                  )));
                    },
                    name: 'Short Courses'),
                SizedBox(
                  height: 20,
                ),
                Buttons(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LongCoursesUI(
                                    shouldRefresh: true,
                                  )));
                    },
                    name: 'Long Courses'),
                SizedBox(
                  height: 20,
                ),
                Buttons(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomisedCoursesUI(
                                    shouldRefresh: true,
                                  )));
                    },
                    name: 'Customised Courses'),
                SizedBox(
                  height: 20,
                ),
                Buttons(onPressed: generatePDF, name: 'Download Courses Info'),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.08,
        color: const Color.fromRGBO(134, 188, 66, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardUI()));
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdmissionDashboardUI()));
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
                      Icons.app_registration,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Admission',
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileUI(
                              shouldRefresh: true,
                            )));
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
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Profile',
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
      ),
    );
  }

  Future<void> generatePDF() async {
    const snackBar = SnackBar(
      content: Text('Preparing Printing, Please wait'),
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
    print('Print Triggered!!');

    final apiService = await CourseDownloadAPIService.create();

    final Map<String, dynamic>? dashboardData = await apiService.getResult();
    if (dashboardData == null || dashboardData.isEmpty) {
      print(
          'No data available or error occurred while fetching dashboard data');
      return;
    }
    print(dashboardData);

    final Map<String, dynamic>? records = dashboardData['data'] ?? [];
    print(records);
    if (records == null || records.isEmpty) {
      print('No records available');
      return;
    }

    String link = records['download_link'];

    try {
      print('PDF generated successfully. Download URL: ${link}');
      final Uri url = Uri.parse(link);
      var data = await http.get(url);
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => data.bodyBytes);
    } catch (e) {
      // Handle any errors
      print('Error generating PDF: $e');
    }
  }
}
