import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

class HLine extends StatelessWidget {
  final double? width;
  final Color? color;

  const HLine({
    Key? key,
    this.color,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: width ?? 2,
      color: color ?? kLightColor,
    );
  }
}
