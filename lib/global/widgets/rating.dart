// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/utils/general_utils.dart';

class Rating extends StatelessWidget {
  final Color? color;
  final double? rating;
  const Rating({
    Key? key,
    this.color,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          doubleToString(rating!, 1),
          style: h4LiteTextStyle.copyWith(color: color),
        ),
        Image.asset(
          'assets/icons/star.png',
          width: smallIconSize,
          color: kStarColor,
        )
      ],
    );
  }
}
