// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(23, 134, 215, 83),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 400,
              color: Color.fromRGBO(23, 134, 215, 83),
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
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
