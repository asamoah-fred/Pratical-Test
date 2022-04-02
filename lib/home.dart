// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:practical_test/widgets/button/button.dart';
import 'package:practical_test/widgets/button/button_data.dart';
import 'package:practical_test/widgets/container.dart';
import 'package:practical_test/widgets/textformfield/textform.dart';
import 'package:practical_test/widgets/textformfield/textform_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    if (value == null || value.trim().length == 0) {
                      return "Field is required";
                    }
                    if (!RegExp(r"/^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/")
                        .hasMatch(value)) {
                      return "Password should have at least";
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
