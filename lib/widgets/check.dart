import 'package:flutter/material.dart';

class check extends StatefulWidget {
  const check({Key? key}) : super(key: key);

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: value
              ? Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.white,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  size: 20,
                  color: Colors.green,
                ),
        ),
      ),
    );
  }
}
