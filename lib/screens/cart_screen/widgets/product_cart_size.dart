// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/types.dart';

class ProductCartSize extends StatelessWidget {
  final Sizes size;
  const ProductCartSize({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      size.name.toUpperCase(),
      style: h4LiteTextStyle,
    );
  }
}
