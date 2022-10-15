// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/utils/borders.dart';

class OfferTimer extends StatelessWidget {
  final DateTime? offerEndDate;
  final DateTime? offerStartDate;

  const OfferTimer({Key? key, this.offerEndDate, required this.offerStartDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int allDuration = offerEndDate!.difference(offerStartDate!).inMinutes;
    int remainingDuration = offerEndDate!.difference(DateTime.now()).inMinutes;
    double ratio = remainingDuration / allDuration;
    return Positioned(
      bottom: kVPad / 2,
      right: kHPad / 2,
      child: DottedBorder(
        borderType: BorderType.Circle,
        padding: EdgeInsets.zero,
        color: kLoveColor,
        dashPattern: getPattern(ratio, 45),
        strokeCap: StrokeCap.round,
        strokeWidth: 5,
        child: Container(
          padding: EdgeInsets.all(smallPadding),
          alignment: Alignment.center,
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.circular(500),
          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              formatOfferEndData,
              style: h4LightTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
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
      return '${inDays}Days';
    } else if (inHours > 1) {
      return "${inHours}Hours";
    } else if (inMinutes > 1) {
      return '${inMinutes}Minutes';
    } else {
      return '${inSeconds}Seconds';
    }
  }
}
