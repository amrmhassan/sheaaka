import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class CustomIconButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onTap;
  final double? width;

  const CustomIconButton({
    Key? key,
    required this.iconName,
    required this.onTap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        'assets/icons/$iconName.png',
        width: width ?? mediumIconSize,
        color: kBlackColor,
      ),
    );
  }
}
