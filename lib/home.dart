// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:practical_test/widgets/container.dart';
import 'package:practical_test/widgets/textformfield/textform.dart';
import 'package:practical_test/widgets/textformfield/textform_data.dart';

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
            CustomContainer(),
            SizedBox(
              height: 35,
            ),
            TextForm(
              textFieldForm: TextFormData(
                hintText: 'Email',
                obscure: false,
                Validator: (String? value) {
                  if (value == null || value.trim().length == 0) {
                    return "Field is required";
                  }
                  if (!RegExp(
                          r"^\w+([\.\-\+]?\w*)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
                      .hasMatch(value)) {
                    return "Please Enter valid Email";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
