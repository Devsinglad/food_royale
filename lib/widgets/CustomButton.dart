import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  Widget? image;
  String? title;
  double height;
  double width;
  Color color;
  Color Shadowcolor;

  CustomButton(
      {Key? key,
      this.image,
      this.title,
      required this.height,
      required this.width,
      required this.color,
      required this.Shadowcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            color: color,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: Shadowcolor,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image ?? SizedBox(),
                Text(
                  title ?? '',
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
