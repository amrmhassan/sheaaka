// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final Color? color;
  final double? height;
  final BoxDecoration? decoration;
  final Alignment? alignment;

  const PaddingWrapper({
    Key? key,
    required this.child,
    this.width,
    this.padding,
    this.color,
    this.decoration,
    this.height,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      alignment: alignment,
      decoration: decoration,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: kHPad,
          ),
      child: child,
    );
  }
}
