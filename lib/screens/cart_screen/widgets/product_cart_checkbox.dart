// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ProductCartCheckBox extends StatelessWidget {
  final bool checked;
  final VoidCallback? onTap;
  final Color? color;

  const ProductCartCheckBox({
    Key? key,
    this.checked = false,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dimension = 22 + (checked ? 4 : 0);
    return ButtonWrapper(
      width: dimension,
      height: dimension,
      padding: EdgeInsets.all(smallPadding),
      decoration: BoxDecoration(
        color: !checked ? null : (color ?? kPrimaryColor),
        borderRadius: BorderRadius.circular(smallBorderRadius),
        border: !checked ? Border.all(width: 2, color: kSecondaryColor) : null,
      ),
      onTap: onTap,
      child: checked
          ? Image.asset(
              'assets/icons/check-mark.png',
              color: kLightColor,
            )
          : null,
    );
  }
}
