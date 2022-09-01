// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? width;

  const PaddingWrapper({
    Key? key,
    required this.child,
    this.width,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: kHPad,
          ),
      child: child,
    );
  }
}
