import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

class ButtonWrapper extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final bool splash;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final Clip? clipBehavior;

  const ButtonWrapper({
    Key? key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = 10,
    this.decoration,
    this.padding,
    this.splash = true,
    this.margin,
    this.alignment,
    this.clipBehavior,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: clipBehavior ?? Clip.hardEdge,
      alignment: alignment,
      margin: margin,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? kMainButtonColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: padding,
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
