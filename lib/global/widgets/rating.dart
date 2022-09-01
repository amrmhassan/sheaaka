// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.8'),
        Image.asset(
          'assets/icons/star.png',
          width: smallIconSize,
          color: kStarColor,
        )
      ],
    );
  }
}
