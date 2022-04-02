// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState(); 
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 120,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Icon(
                  Icons.school_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              Text(
                "TeamTrics",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
