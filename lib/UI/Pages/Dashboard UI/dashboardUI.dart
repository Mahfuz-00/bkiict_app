import 'package:bkiict_app/UI/Widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import '../../../Data/Data Sources/API Service (Log Out)/apiServiceLogOut.dart';
import '../../../Data/Data Sources/API Service (Notice)/apiServiceNotice.dart';
import '../../../Data/Data Sources/API Service (Result)/apiServiceResult.dart';
import '../../Bloc/auth_cubit.dart';
import '../About Us UI/aboutusUI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Admission UI/admissiondashboardUI.dart';
import '../Course Dashboard UI/coursedashboard.dart';
import '../Login UI/loginUI.dart';
import '../Profile UI/profileUI.dart';

/// [DashboardUI] is a stateful widget that represents the main dashboard of the BKIICT application.
/// It provides access to various functionalities such as courses, admission, and user profile.
///
/// Actions:
/// - Navigate to [CourseDashboardUI] when the Courses button is pressed.
/// - Navigate to [AdmissionDashboardUI] when the Admission button is pressed.
/// - Navigate to [AboutUsUI] when the About Us button is pressed.
/// - Trigger PDF generation when the Result button is pressed.
/// - Show a logout confirmation dialog when the Log Out button is tapped.
///
/// Variables:
/// - [scaffoldKey]: A GlobalKey used to manage the Scaffold state.
class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return PopScope(
  /*    canPop: false,*/
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF5202),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Row(
            children: [
              SizedBox(
                width: 28,
              ),
              const Text(
                'Learning Engineering Institute',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'default',
                ),
              ),
            ],
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
              color: Colors.grey[100],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Welcome to Learning Engineering Institute',
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
                        'Learning Engineering Institute is a unique training institution offering professional electrical courses both online and offline.',
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
                                builder: (context) => const CourseDashboardUI()));
                      },
                      name: 'Courses'),
                  SizedBox(
                    height: 20,
                  ),
                  Buttons(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdmissionDashboardUI()));
                      },
                      name: 'Admission'),
                  SizedBox(
                    height: 20,
                  ),
                  Buttons(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsUI()));
                    },
                    name: 'About Us',
                  ),
              /*    SizedBox(
                    height: 20,
                  ),
                  Buttons(onPressed: NoticegeneratePDF, name: 'Download Notice'),*/
                  SizedBox(
                    height: 20,
                  ),
                  Buttons(onPressed: ResultgeneratePDF, name: 'Download Result'),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: screenHeight * 0.08,
          color: const Color(0xFFFF5202),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileUI(
                                shouldRefresh: true,
                              )));
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
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  _showLogoutDialog(context);
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
                        Icons.logout,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Log Out',
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
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Text(
                'Logout Confirmation',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'default',
                ),
              ),
              Divider()
            ],
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: TextStyle(
              color: const Color(0xFFFF5202),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'default',
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: const Color(0xFFFF5202),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'default',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove('userName');
                    await prefs.remove('organizationName');
                    await prefs.remove('photoUrl');
                    var logoutApiService = await LogOutApiService.create();
                    logoutApiService.authToken;
                    if (await logoutApiService.signOut()) {
                      Navigator.pop(context);
                      context.read<AuthCubit>().logout();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  LoginUI()));
                    }
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'default',
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> ResultgeneratePDF() async {
    const snackBar = SnackBar(
      content: Text('Preparing Printing, Please wait'),
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
    print('Print Triggered!!');

    final apiService = await ResultAPIService.create();
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
      const snackBar = SnackBar(
        content: Text('Download Failed. Please try again'),
      );
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
      print('Error generating PDF: $e');
    }
  }

  Future<void> NoticegeneratePDF() async {
    const snackBar = SnackBar(
      content: Text('Preparing Printing, Please wait'),
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
    print('Print Triggered!!');

    final apiService = await NoticeAPIService.create();
    final Map<String, dynamic>? dashboardData = await apiService.getNotice();
/*    final snackBar1 = SnackBar(
      content: Text('$dashboardData'),
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar1);*/
    print('Print Triggered!!');
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

 /*   final snackBar2 = SnackBar(
      content: Text('$records'),
    );
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar2);*/

    String link = records['download_link'];
    try {
      print('PDF generated successfully. Download URL: ${link}');
      final Uri url = Uri.parse(link);
      var data = await http.get(url);
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => data.bodyBytes);
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Download Failed. Please try again'),
      );
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(snackBar);
      print('Error generating PDF: $e');
    }
  }
}
