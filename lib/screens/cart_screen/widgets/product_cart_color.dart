// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductCartColor extends StatelessWidget {
  final Color color;
  const ProductCartColor({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'أزرق',
      style: h4LightTextStyle.copyWith(color: color),
    );
  }
}
