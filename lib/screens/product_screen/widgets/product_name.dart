// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductName extends StatelessWidget {
  const ProductName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'قميص أبيض فاتح',
      style: h3TextStyle,
    );
  }
}
