// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class FormHeaderWithLogo extends StatelessWidget {
  final String iconName;
  final String? title;
  const FormHeaderWithLogo({
    Key? key,
    required this.iconName,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/icons/$iconName.png',
            width: 180,
            fit: BoxFit.cover,
          ),
        ),
        if (title != null)
          Text(
            title.toString(),
            style: h1TextStyle,
          ),
      ],
    );
  }
}
