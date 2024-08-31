import 'package:flutter/material.dart';

import '../Pages/Feedback UI/feedbackUI.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(134, 188, 66, 1),
            fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
                MediaQuery.of(context).size.height * 0.08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeedbackUI()));
          },
          child: const Text('Feedback',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'default',
              )),
        ),
      ),
    );
  }
}