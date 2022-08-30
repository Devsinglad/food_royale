import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  String title;
  Color color;
  FontWeight weight;
  double size;
  TextOverflow overflow;

  MyText({
    Key? key,
    required this.title,
    required this.color,
    required this.weight,
    required this.size,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          maxLines: 1,
          style: GoogleFonts.lato(
            fontWeight: weight,
            color: color,
            fontSize: size,
          ),
          overflow: overflow,
        ),
      ],
    );
  }
}
