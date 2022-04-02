// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white54,
              filled: true,
            ),
            validator: (value) {},
          ),
        ],
      ),
    );
  }
}
