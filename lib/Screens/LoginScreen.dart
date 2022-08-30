import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_royale/Screens/Product_overiew_screen.dart';

import '../widgets/CustomBackground.dart';
import '../widgets/CustomButton.dart';
import '../widgets/MyText.dart';
import '../widgets/reuseableField.dart';
import 'SignUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _PasswordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  var auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _PasswordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              customBackground(),
              SizedBox(height: 30),
              reuseuablefield(
                "Enter Email",
                Icons.person,
                false,
                TextInputType.emailAddress,
                _emailTextController,
              ),
              SizedBox(
                height: 20,
              ),
              reuseuablefield(
                'Enter Password',
                Icons.lock,
                true,
                TextInputType.visiblePassword,
                _PasswordTextController,
              ),
              SizedBox(
                height: 20,
              ),
              MyText(
                title: 'Sign Up with',
                color: Colors.green,
                size: 14,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    image: Image.asset(
                      'assets/images/Facebook-logo.png',
                      height: 60,
                      width: 60,
                    ),
                    title: 'facebook',
                    height: 57,
                    width: 152,
                    color: Colors.white10,
                    Shadowcolor: Colors.transparent,
                  ),
                  CustomButton(
                    image: Image.asset(
                      'assets/images/google.jpg',
                      height: 30,
                      width: 60,
                    ),
                    title: 'Google',
                    height: 57,
                    width: 152,
                    color: Colors.white10,
                    Shadowcolor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                      title: 'Forgot Your Password?',
                      color: Colors.green,
                      weight: FontWeight.w600,
                      size: 16),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: MyText(
                        title: 'Create Account',
                        color: Colors.blueGrey,
                        weight: FontWeight.w600,
                        size: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              signinButton(context, true, () {
                try {
                  auth
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text.toString().trim(),
                          password: _PasswordTextController.text)
                      .then((_) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductsOverviewScreen()));
                  });
                } catch (e, s) {
                  print(e);
                  print(s);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
