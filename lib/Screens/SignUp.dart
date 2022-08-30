import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomBackground.dart';
import '../widgets/MyText.dart';
import '../widgets/check.dart';
import '../widgets/reuseableField.dart';
import 'LoginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  bool isChecked = false;
  var auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _userNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneNumberTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            customBackground(),
            SizedBox(
              height: 20,
            ),
            MyText(
                title: 'Create Free Account',
                color: Colors.white,
                weight: FontWeight.w700,
                size: 18),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter UserName',
              Icons.person,
              false,
              TextInputType.text,
              _userNameTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Phone Number',
              Icons.phone,
              false,
              TextInputType.phone,
              _phoneNumberTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter Email',
              Icons.email_outlined,
              false,
              TextInputType.emailAddress,
              _emailTextController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseuablefield(
              'Enter Password',
              Icons.lock_outline,
              true,
              TextInputType.visiblePassword,
              _passwordTextController,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  check(),
                  SizedBox(
                    width: 10,
                  ),
                  MyText(
                      title: 'Keep Me Signed In',
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 14)
                ],
              ),
            ),
            signinButton(context, false, () async {
              try {
                var instance = await auth
                    .createUserWithEmailAndPassword(
                  email: _emailTextController.text.toString().trim(),
                  password: _passwordTextController.text,
                )
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
                // var userdata = await Firebase.instance
                //     .collection('user')
                //     .snapshots();
                // print(userdata);
              } catch (e, s) {
                print(e);
                print(s);
              }
            }),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: MyText(
                  title: 'already have an account?',
                  color: Colors.green,
                  weight: FontWeight.w500,
                  size: 15),
            )
          ],
        ),
      ),
    );
  }
}
