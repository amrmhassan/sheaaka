// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class NOfFollowers extends StatelessWidget {
  final int num;
  final Color? color;
  const NOfFollowers({
    Key? key,
    required this.num,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: h4TextStyleInactive.copyWith(color: color),
        children: [
          TextSpan(
            text: num.toString(),
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: 'متابع',
          ),
        ],
      ),
    );
  }
}
