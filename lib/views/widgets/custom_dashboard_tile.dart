import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDashboardTile extends StatelessWidget {
  const CustomDashboardTile(
      {super.key,
      required this.title1,
      required this.title2,
      required this.value1,
      required this.value2,
      required this.color1,
      required this.color2,
      required this.size,
      required this.height1,
      required this.width1,
      required this.height2,
      required this.width2});

  final Size size;
  final double height1;
  final double width1;
  final double height2;
  final double width2;
  final String title1;
  final String title2;
  final String value1;
  final String value2;
  final Color? color1;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height1,
            width: width1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
              color: color1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    value1,
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: height2,
          width: width2,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            color: color2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title2,
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  value2,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
