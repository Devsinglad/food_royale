import 'package:flutter/material.dart';

TextField reuseuablefield(String text, IconData icon, bool isPasswordType,
    TextInputType keyboardType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.green,
    textInputAction: TextInputAction.done,
    style: TextStyle(
      color: Colors.white.withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.green,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.cyan.withOpacity(0.5)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.cyan.withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: keyboardType,
  );
}

Container signinButton(BuildContext context, bool islogin, Function ontap) {
  return Container(
    width: 150,
    height: 50,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      child: Text(
        islogin ? 'LOG IN' : 'Create Account',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green;
          }
          return Colors.cyan.withOpacity(0.5);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}
