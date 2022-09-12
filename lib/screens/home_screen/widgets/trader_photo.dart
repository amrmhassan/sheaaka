// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/trader_photo.dart';
import 'package:project/utils/borders.dart';

class TraderPhoto extends StatelessWidget {
  final String logoImagePath;
  const TraderPhoto({
    Key? key,
    required this.logoImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: kPrimaryColor,
      borderType: BorderType.Circle,
      strokeWidth: 2,
      padding: EdgeInsets.all(bigCirclePadding),
      strokeCap: StrokeCap.round,
      radius: Radius.circular(50),
      dashPattern: [
        getDashLength(
          gapLength,
          nOfSections,
          smallCircleRadius,
          bigCirclePadding,
        ),
        gapLength
      ],
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: smallCircleRadius,
        height: smallCircleRadius,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(500),
          border: Border.all(width: 1 / 2, color: kBlackColor),
        ),
        child: Image.asset(
          logoImagePath,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }
}
