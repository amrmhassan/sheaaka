// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class FormHeaderWithLogo extends StatelessWidget {
  const FormHeaderWithLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/icons/login.png',
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'شياكة',
          style: h1TextStyle,
        ),
      ],
    );
  }
}
