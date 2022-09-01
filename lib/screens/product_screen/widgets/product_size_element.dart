// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';

class ProductSizeElement extends StatelessWidget {
  //? i will replace this with all available sizes
  final String title;
  final bool active;

  const ProductSizeElement({
    Key? key,
    required this.title,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: mediumPadding),
      alignment: Alignment.center,
      width: largeIconSize,
      height: largeIconSize,
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : kLightColor,
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Text(
        title,
        style: h3TextStyle.copyWith(
          color: active ? Colors.white : kInActiveTextColor,
        ),
      ),
    );
  }
}
