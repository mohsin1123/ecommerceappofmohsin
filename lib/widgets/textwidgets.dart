import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? weight;
  final Color? color;

  const NormalText(
      {Key? key,
      required this.text,
      required this.size,
      this.weight,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.poppins(
          fontSize: size,
          fontWeight: weight,
          color: color,
        ));
  }
}
