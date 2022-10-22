// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class ProductCartColor extends StatelessWidget {
  final Color color;
  const ProductCartColor({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediumIconSize,
      height: mediumIconSize / 2,
      decoration: BoxDecoration(
          color: color,
          border: color == Colors.white
              ? Border.all(width: 1, color: kSecondaryColor.withOpacity(.5))
              : null),
    );
    // return Text(
    //   'أزرق',
    //   style: h4LightTextStyle.copyWith(color: color),
    // );
  }
}
