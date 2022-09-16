// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/utils/borders.dart';

class OfferTimer extends StatelessWidget {
  final DateTime? offerEndDate;

  const OfferTimer({
    Key? key,
    this.offerEndDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: kVPad / 2,
      right: kHPad / 2,
      child: DottedBorder(
        borderType: BorderType.Circle,
        padding: EdgeInsets.zero,
        color: kLoveColor,
        dashPattern: getPattern(.75, 45),
        strokeCap: StrokeCap.round,
        strokeWidth: 5,
        child: Container(
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(500),
          ),
          child: Text(
            formatOfferEndData,
            style: h4LightTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  String get formatOfferEndData {
    DateTime now = DateTime.now();
    DateTime end = offerEndDate!;
    Duration diff = end.difference(now);
    int inDays = diff.inDays;
    int inHours = diff.inHours;
    int inMinutes = diff.inMinutes;
    int inSeconds = diff.inSeconds;
    if (inDays > 1) {
      return '$inDays D';
    } else if (inHours > 1) {
      return "$inHours H";
    } else if (inMinutes > 1) {
      return '$inMinutes M';
    } else {
      return '$inSeconds S';
    }
  }
}
