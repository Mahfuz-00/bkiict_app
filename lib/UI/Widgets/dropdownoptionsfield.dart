import 'package:flutter/material.dart';

/// A helper class to build a dropdown form field based on a map of options
/// and a selected value. It provides a label text and an [onChanged] callback
/// for handling changes in the selected value.
///
/// The [DropdownFormFieldBuilder] takes the following parameters:
/// - [options]: A map where the key is a string representing the category,
///   and the value is a list of strings representing the selectable options.
/// - [labelText]: A string to display as the label for the dropdown.
/// - [selectedValue]: The currently selected value, which can be null.
/// - [onChanged]: A callback function that is triggered when the selected
///   value changes.
class DropdownField<T> extends StatefulWidget {
  final String hintText;
  final List<DropdownMenuItem<T>> dropdownItems;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;

  DropdownField({
    required this.hintText,
    required this.dropdownItems,
    this.initialValue,
    this.onChanged,
  });

  @override
  _DropdownFormFieldState<T> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends State<DropdownField<T>> {
  late T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'default',
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'default',
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      value: _selectedValue,
      items: widget.dropdownItems,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
