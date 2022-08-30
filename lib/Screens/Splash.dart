import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'OnboardingScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navgatetohome();
  }

  _navgatetohome() async {
    await Future.delayed(
      Duration(milliseconds: 5000),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 300,
              width: 500,
              child: Image.asset(
                'assets/images/Pattern2 (3).png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Image.asset(
                'assets/images/logo2.png',
                fit: BoxFit.fill,
              ),
              height: 200,
              width: 300,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Food Royale',
                style: GoogleFonts.lato(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ),
            Center(
              child: Text(
                'Deliver Favorite Food',
                style: GoogleFonts.acme(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
