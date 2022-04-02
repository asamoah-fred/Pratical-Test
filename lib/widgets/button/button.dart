// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practical_test/widgets/button/button_data.dart';

class Button extends StatelessWidget {
  const Button({required this.button, Key? key}) : super(key: key);
  final ButtonData button;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Text(
        button.text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
