import 'package:flutter/material.dart';
import 'package:food_royale/Screens/LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Board(
                imageUrl: 'assets/animations/43518-food-delivery.json',
                title: 'Find your Comfort\nFood here',
                subtitle:
                    'Here You Can find a dish for every taste and color.Enjoy! ',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Board(
                imageUrl: 'assets/animations/44374-food-delivery-process.json',
                title: 'Food Royale is Where Your Comfort \nFood lives!',
                subtitle:
                    'Enjoy a fast and smooth food Delivery at your \ndoorstep',
              ),
            ),
          ],
        ));
  }
}

class Board extends StatelessWidget {
  String imageUrl;
  String title;
  String subtitle;

  Board(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 433.22,
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.6),
            child: Center(
              child: Lottie.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            subtitle,
            style: GoogleFonts.trispace(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Container(
              height: 57,
              width: 157,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green,
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
