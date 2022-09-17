// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductCartQuantity extends StatelessWidget {
  final int quantity;
  const ProductCartQuantity({Key? key, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      quantity.toString(),
      style: h3TextStyle,
    );
  }
}
