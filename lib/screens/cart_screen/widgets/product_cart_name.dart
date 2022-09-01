// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductCartName extends StatelessWidget {
  const ProductCartName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'تيشيرت أحمر',
      style: h2TextStyle,
    );
  }
}
