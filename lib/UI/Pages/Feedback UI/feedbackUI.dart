import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Widgets/feedbackbodycontainer.dart';

/// [FeedbackUI] is a StatefulWidget that represents the feedback screen in the app.
/// It allows users to provide feedback on the application or its features.
///
/// The [build] method constructs the UI, including:
/// - An AppBar with a back button and a title "Feedback".
/// - A [BodyContainer] widget to encapsulate the main content of the feedback screen.
class FeedbackUI extends StatefulWidget {
  const FeedbackUI({super.key});

  @override
  State<FeedbackUI> createState() => _FeedbackUIState();
}

class _FeedbackUIState extends State<FeedbackUI>
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
          'Feedback',
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
        child:
            BodyContainer(screenWidth: screenWidth, screenHeight: screenHeight),
      )),
    );
  }
}
