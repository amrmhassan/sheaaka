import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class VLine extends StatelessWidget {
  final double? thickness;
  final Color? color;
  final double? borderRadius;
  final double? height;

  const VLine({
    Key? key,
    this.color,
    this.thickness,
    this.borderRadius,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: thickness ?? 2,
      height: height ?? kVPad,
      decoration: BoxDecoration(
        color: color ?? kLightColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
    );
  }
}
