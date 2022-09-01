// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class HPostInfo extends StatelessWidget {
  const HPostInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'تيشيرت أصفر',
          style: h3TextStyle,
        ),
        Text(
          'نيو فاشون',
          style: h4LiteTextStyle,
        ),
      ],
    );
  }
}
