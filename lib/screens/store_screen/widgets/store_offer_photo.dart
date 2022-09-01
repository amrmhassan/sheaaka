// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/utils/borders.dart';

const double _radius = 80;
const double _storeWidth = 3;
const double _borderPercentage = .40;

class StoreOfferPhoto extends StatelessWidget {
  const StoreOfferPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      padding: EdgeInsets.zero,
      color: kPrimaryColor,
      dashPattern: getPattern(_borderPercentage, _radius),
      strokeCap: StrokeCap.round,
      strokeWidth: _storeWidth,
      child: Container(
        margin: EdgeInsets.all(_storeWidth / 2),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        width: _radius,
        height: _radius,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Image.asset(
            'assets/images/1.jpg',
            // width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
