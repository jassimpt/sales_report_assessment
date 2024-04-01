import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsRow extends StatelessWidget {
  const EmployeeDetailsRow({
    super.key,
    required this.empData,
    required this.head,
  });
  final String head;
  final String empData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            "${head}: ",
            style: const TextStyle(
                color: basicFontColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          Text(
            empData,
            style: const TextStyle(
              color: basicFontColor,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
