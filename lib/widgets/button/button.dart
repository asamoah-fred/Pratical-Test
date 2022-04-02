// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, 
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Text('LOGIN',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
      ),
    );
  }
}