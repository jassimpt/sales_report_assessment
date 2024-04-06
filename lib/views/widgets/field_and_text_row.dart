import 'package:assessment/views/widgets/day_closing_data_head.dart';
import 'package:flutter/material.dart';

class FieldAndTextRow extends StatelessWidget {
  const FieldAndTextRow({
    super.key,
    required this.size,
    required this.text,
    required this.label,
    required this.controller,
  });

  final Size size;
  final String text;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        children: [
          DayClosingDataHead(text: "${text}:"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: size.height * 0.05,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
