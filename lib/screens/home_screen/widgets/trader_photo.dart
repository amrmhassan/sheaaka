// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/trader_photo.dart';
import 'package:project/utils/borders.dart';

class TraderPhoto extends StatelessWidget {
  final String? logoImagePath;
  final int offersNumber;

  const TraderPhoto({
    Key? key,
    required this.logoImagePath,
    required this.offersNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color:
          offersNumber == 0 ? kSecondaryColor.withOpacity(.5) : kPrimaryColor,
      borderType: BorderType.Circle,
      strokeWidth: 2,
      padding: EdgeInsets.all(bigCirclePadding),
      strokeCap: StrokeCap.round,
      radius: Radius.circular(50),
      dashPattern: [
        getDashLength(
          gapLength,
          offersNumber,
          smallCircleRadius,
          bigCirclePadding,
        ),
        gapLength
      ],
      child: Container(
        padding: logoImagePath == null ? EdgeInsets.all(mediumPadding) : null,
        clipBehavior: Clip.hardEdge,
        width: smallCircleRadius,
        height: smallCircleRadius,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          // border: Border.all(width: 1 / 2, color: kBlackColor),
        ),
        child: logoImagePath != null
            ? Image.network(
                logoImagePath!,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )
            : Image.asset(
                'assets/icons/user.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                color: kSecondaryColor,
              ),
      ),
    );
  }
}
