import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class customBackground extends StatelessWidget {
  const customBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Colors.transparent),
          child: Image.asset(
            'assets/images/Pattern2 (3).png',
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              child: Image.asset('assets/images/logo2.png'),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Text(
              'Food Royale',
              style: GoogleFonts.lato(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.green,
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 230),
            child: Text(
              'Deliver Favorite Food',
              style: GoogleFonts.acme(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
