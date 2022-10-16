// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/global.dart';
import 'package:project/utils/borders.dart';

const double radius = 80;
const double _strokeWidth = 3;
// const double _borderPercentage = .40;

class StoreOfferPhoto extends StatelessWidget {
  final String imagePath;
  final DateTime createdAt;
  final DateTime endAt;

  const StoreOfferPhoto({
    Key? key,
    required this.imagePath,
    required this.createdAt,
    required this.endAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int allDuration = endAt.difference(createdAt).inMinutes;
    int remainingDuration = endAt.difference(DateTime.now()).inMinutes;
    double ratio = remainingDuration / allDuration;

    return DottedBorder(
      borderType: BorderType.Circle,
      padding: EdgeInsets.zero,
      color: kPrimaryColor,
      dashPattern: getPattern(ratio, radius),
      strokeCap: StrokeCap.round,
      strokeWidth: _strokeWidth,
      child: Container(
        margin: EdgeInsets.all(_strokeWidth / 2),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: FadeInImage(
            fadeInDuration: fadeInImageDuration,
            fadeOutDuration: fadeInImageDuration,
            placeholder: loadingImage,
            image: NetworkImage(
              imagePath,
              // width: double.infinity,
            ),
            fit: BoxFit.cover,
            width: double.infinity,
            alignment: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
