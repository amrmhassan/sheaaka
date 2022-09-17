// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/tests/utils.dart';

class ProductCartPrice extends StatelessWidget {
  final FontWeight? fontWeight;
  final double? fontSize;
  final double price;
  final bool active;
  final Color? color;

  const ProductCartPrice({
    Key? key,
    required this.price,
    this.fontWeight,
    this.fontSize,
    this.active = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = h3LightTextStyle.copyWith(
      color: kActiveTextColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    );
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: kPrimaryColor,
              fontSize: h3TextSize,
            ),
        children: [
          TextSpan(
            text: doubleToString(price),
            style: textStyle.copyWith(
              color: color ?? (active ? kPrimaryColor : null),
              decoration: active ? null : TextDecoration.lineThrough,
              height: 1,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: 'جنيه',
            style: textStyle.copyWith(
                decoration: active ? null : TextDecoration.lineThrough,
                color: color,
                height: 1),
          ),
        ],
      ),
    );
  }
}
