import 'package:flutter/material.dart';

class MyTextFieldLarge extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final int minLines;

  const MyTextFieldLarge({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.obscureText,
    this.maxLines = 5, // Text Field Can Be Expanded Up To 5 Lines
    this.minLines = 1, 
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      maxLines: obscureText ? 1 : maxLines, 
      minLines: minLines, 
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20), 
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(20), 
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Roboto', 
          color: Colors.grey[400]
        ),
        // Padding
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20, 
          horizontal: 16,
        ),
      ),
    );
  }
}