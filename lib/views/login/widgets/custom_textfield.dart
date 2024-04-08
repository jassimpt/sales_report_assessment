import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hinttext,
    required this.controller,
    required this.obscureText,
    required this.filled,
    super.key,
  });

  final String hinttext;
  final TextEditingController? controller;
  final bool obscureText;
  final bool filled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is empty';
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hinttext,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          filled: filled,
          fillColor: textFieldFill),
    );
  }
}
