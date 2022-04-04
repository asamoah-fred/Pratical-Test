// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:practical_test/widgets/button/button.dart';
import 'package:practical_test/widgets/button/button_data.dart';
import 'package:practical_test/widgets/image_card.dart';
import 'package:practical_test/widgets/textformfield/textform.dart';
import 'package:practical_test/widgets/textformfield/textform_data.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? username, password, message;

  Future<http.Response> _login(
      {required String username, required String password}) async {
    final http.Response response = await http.post(
      Uri.parse(
        'https://testbox-nellys-coin.ejaraapis.xyz/api/v1/auth/login',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'api-key': '838adf51aa',
        'client-id': 'jL]riHjAgbUZHofblIPigVgq1',
      },
      body: jsonEncode(
        <String, String>{
          'log': '$username',
          'password': '$password',
        },
      ),
    );
    return response.statusCode == 200
        ? http.Response(response.body, 200)
        : http.Response(response.body, response.statusCode);
  }

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
              CustomImageCard(),
              SizedBox(
                height: 35,
              ),
              TextForm(
                onChanged: (value) {
                  username = value;
                },
                textFieldForm: TextFormData(
                  hintText: 'Email',
                  obscure: false,
                  Validator: (String? value) {
                    if (value == null || value.trim().length == 0) {
                      return "Field is required";
                    }
                    return null;
                  },
                ),
              ),
              TextForm(
                onChanged: (value) {
                  password = value;
                },
                textFieldForm: TextFormData(
                  hintText: 'Password',
                  obscure: true,
                  Validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }
                    if (!RegExp(
                            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$^#!%*?&])[A-Za-z\d@$!#%*?^&]{8,}$")
                        .hasMatch(value)) {
                      return """ Password should not be less than 8 and should
  have at least 1 Uppercase, numeric and special 
  characters""";
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
                onTap: () async {
                  if (_formkey.currentState != null &&
                      _formkey.currentState!.validate()) {
                    final http.Response response =
                        await _login(username: username!, password: password!);
                    setState(() {
                      message = jsonDecode(response.body)['message'];
                    });
                  }
                },
                child: Button(
                  button: ButtonData(
                    text: 'LOGIN',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(message ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
