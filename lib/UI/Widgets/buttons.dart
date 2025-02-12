import 'package:flutter/material.dart';

/// A custom button widget that provides a styled button for user interaction.
///
/// This widget is designed to be reusable and customizable for different actions within the application.
///
/// Key functionalities include:
/// - [onPressed]: A callback function that is triggered when the button is pressed.
/// - [name]: The text label displayed on the button.
class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;

  Buttons({
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF5202),
            fixedSize: Size(
              MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height * 0.08,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
            ),
          ),
        ),
      ),
    );
  }
}
