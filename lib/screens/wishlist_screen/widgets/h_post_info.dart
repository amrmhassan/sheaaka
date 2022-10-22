// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class HPostInfo extends StatelessWidget {
  final String name;
  final String storeName;
  const HPostInfo({
    Key? key,
    required this.name,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: h3TextStyle,
        ),
        Text(
          storeName,
          style: h4LiteTextStyle,
        ),
      ],
    );
  }
}
