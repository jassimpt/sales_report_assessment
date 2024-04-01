import 'package:assessment/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomTileRow extends StatelessWidget {
  const CustomTileRow(
      {super.key,
      required this.size,
      required this.icon1,
      required this.text1,
      required this.text2,
      required this.onTap1,
      required this.onTap2,
      required this.icon2});

  final Size size;
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  final void Function()? onTap1;
  final void Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: onTap1,
            child: Container(
              width: size.width * 0.45,
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                  color: splashBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon1,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      text1,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: onTap2,
            child: Container(
              width: size.width * 0.45,
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                  color: splashBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon2,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      text2,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
