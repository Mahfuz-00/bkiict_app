import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A custom [TextFormField] widget that encapsulates a [TextEditingController],
/// label text, validation logic, keyboard type, input formatters, It is designed for consistent styling
/// and usability across various input types.
///
/// **Variables:**
/// - [controller]: The controller for managing the text input.
/// - [labelText]: The text to display as the label for the input field.
/// - [validator]: The validation function to validate the input.
/// - [keyboardType]: The type of keyboard to display for the input.
/// - [inputFormatters]: The formatters to apply to the input text.
/// - [height]: A boolean to determine if a larger height should be used.
/// - [obscureText]: Whether to obscure the text (e.g., for passwords).
/// - [suffixIcon]: The suffix icon widget, often used for toggling password visibility.
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obscureText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.075,
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            obscureText: obscureText ?? false,
            style: const TextStyle(
              color: Color.fromRGBO(143, 150, 158, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'default',
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: labelText,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'default',
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
