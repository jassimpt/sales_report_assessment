import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton(
      {super.key, required this.size, required this.onPressed});

  final Size size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
      child: SizedBox(
        width: size.width,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor: const MaterialStatePropertyAll(buttonColor1),
          ),
          onPressed: onPressed,
          child: const Text(
            "Submit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
