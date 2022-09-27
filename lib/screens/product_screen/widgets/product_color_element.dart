// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class ProductColorElement extends StatelessWidget {
  final Color color;
  final bool border;
  final bool active;

  const ProductColorElement({
    Key? key,
    required this.color,
    this.border = false,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(largePadding * 1.2),
      width: largeIconSize,
      height: largeIconSize,
      margin: EdgeInsets.only(left: mediumPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        color: color,
        border: border
            ? Border.all(
                width: 1,
                color: kSecondaryColor.withOpacity(.3),
              )
            : null,
      ),
      child: active
          ? Image.asset(
              'assets/icons/check-mark.png',
              color: border ? Colors.black : Colors.white,
            )
          : SizedBox(),
    );
  }
}
