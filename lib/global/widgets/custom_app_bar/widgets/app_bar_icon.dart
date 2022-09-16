import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class AppBarIcon extends StatelessWidget {
  final String? iconName;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? color;
  final Widget? child;

  const AppBarIcon({
    Key? key,
    required this.onTap,
    this.iconName,
    this.backgroundColor,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: roundIconRadius,
        height: roundIconRadius,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: backgroundColor ?? kLightColor,
        ),
        child: child ??
            Image.asset(
              'assets/icons/$iconName.png',
              width: 25,
              color: color ?? kBlackColor,
            ),
      ),
    );
  }
}
