// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';

class NotifyingBox extends StatelessWidget {
  final String title;
  const NotifyingBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 3,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(smallBorderRadius),
        ),
        child: Text(
          title,
          style: h3TextStyle.copyWith(
            color: Colors.white,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
