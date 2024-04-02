import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class DayClosingDataField extends StatelessWidget {
  const DayClosingDataField(
      {super.key,
      required this.fillColor,
      required this.readOnly,
      required this.controller});

  final bool readOnly;
  final Color fillColor;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          fillColor: textFieldFill,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
