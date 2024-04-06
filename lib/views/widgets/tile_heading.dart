import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TileHeading extends StatelessWidget {
  const TileHeading({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text1 ",
          style:
              GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          text2,
          style: GoogleFonts.openSans(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
