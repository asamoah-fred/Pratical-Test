// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:practical_test/widgets/button/button.dart';
import 'package:practical_test/widgets/button/button_data.dart';
import 'package:practical_test/widgets/container.dart';
import 'package:practical_test/widgets/textformfield/textform.dart';
import 'package:practical_test/widgets/textformfield/textform_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
              TextForm(
                textFieldForm: TextFormData(
                  hintText: 'Password',
                  obscure: true,
                  Validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }
                    if (!RegExp(
                            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$")
                        .hasMatch(value)) {
                      return """ Password should not be less than 8 and should
  have at least 1 Uppercase and numeric character""";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Forget your password?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState != null &&
                      _formkey.currentState!.validate()) {}
                },
                child: Button(
                  button: ButtonData(
                    text: 'LOGIN',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
