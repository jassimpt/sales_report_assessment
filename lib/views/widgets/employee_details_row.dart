import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsRow extends StatelessWidget {
  const EmployeeDetailsRow(
      {super.key,
      required this.empData,
      required this.head,
      required this.bordered});
  final String head;
  final String empData;
  final bool bordered;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: bordered
                ? Border.all(color: Colors.grey.withOpacity(0.3))
                : null),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${head}: ",
                style: const TextStyle(
                    color: basicFontColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                empData,
                style: const TextStyle(
                  color: basicFontColor,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
