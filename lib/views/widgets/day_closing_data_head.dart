import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class DayClosingDataHead extends StatelessWidget {
  const DayClosingDataHead({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Text(
        text,
        style: const TextStyle(
            color: basicFontColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
