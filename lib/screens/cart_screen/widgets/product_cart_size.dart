// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductCartSize extends StatelessWidget {
  const ProductCartSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'XL',
      style: h4LiteTextStyle,
    );
  }
}
