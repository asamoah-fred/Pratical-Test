// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practical_test/widgets/textformfield/textform_data.dart';
import 'package:practical_test/widgets/textformfield/textform_list.dart';

class TextForm extends StatelessWidget {
  const TextForm({required this.textFieldForm, Key? key}) : super(key: key);
  final TextFormData textFieldForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: textFieldForm.obscure,
              decoration: InputDecoration(
                hintText: textFieldForm.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                fillColor: Colors.white54,
                filled: true,
              ),
              validator: textFieldForm.Validator,
            ),
          ),
        ),
      ],
    );
  }
}
