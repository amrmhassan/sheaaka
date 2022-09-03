import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

class HLine extends StatelessWidget {
  final double? width;
  final Color? color;
  final double? borderRadius;
  final double? widthFactor;

  const HLine({
    Key? key,
    this.color,
    this.width,
    this.borderRadius,
    this.widthFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor ?? 1,
      child: Container(
        width: double.infinity,
        height: width ?? 2,
        decoration: BoxDecoration(
          color: color ?? kLightColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
    );
  }
}
