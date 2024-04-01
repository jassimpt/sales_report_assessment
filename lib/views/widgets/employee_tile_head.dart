import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class EmployeeTileHeading extends StatelessWidget {
  const EmployeeTileHeading(
      {super.key, required this.size, required this.heading});

  final Size size;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.05,
      decoration: const BoxDecoration(
          color: splashBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
