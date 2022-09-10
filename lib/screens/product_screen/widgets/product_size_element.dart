// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/types.dart';

class ProductSizeElement extends StatelessWidget {
  //? i will replace this with all available sizes
  final Sizes size;
  final bool active;

  const ProductSizeElement({
    Key? key,
    required this.size,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: mediumPadding),
      alignment: Alignment.center,
      width: largeIconSize * 1.2,
      height: largeIconSize * 1.2,
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : kLightColor,
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Text(
        sizeLetter(size.name),
        style: h3TextStyle.copyWith(
          color: active ? Colors.white : kInActiveTextColor,
        ),
      ),
    );
  }

  String sizeLetter(String s) {
    // String f = s[0];
    // f = f.toUpperCase();
    // s = s.substring(1);

    return s.toUpperCase();
  }
}
