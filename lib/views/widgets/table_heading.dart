import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class TableHeading extends StatelessWidget {
  const TableHeading({super.key, required this.size, required this.text});

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: size.width * 0.22,
        height: size.height * 0.05,
        decoration: const BoxDecoration(color: splashBackgroundColor),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
