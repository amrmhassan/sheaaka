// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ProductCartCheckBox extends StatelessWidget {
  final bool checked;
  final VoidCallback? onTap;

  const ProductCartCheckBox({
    Key? key,
    this.checked = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      width: 22,
      height: 22,
      padding: EdgeInsets.all(smallPadding),
      decoration: BoxDecoration(
        color: !checked ? null : kPrimaryColor,
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
