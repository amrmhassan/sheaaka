// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ImagePickingOptionElement extends StatelessWidget {
  final String iconName;
  final VoidCallback onTap;

  const ImagePickingOptionElement({
    Key? key,
    required this.iconName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap,
      padding: EdgeInsets.all(largePadding),
      backgroundColor: Colors.transparent,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        border: Border.all(width: 2, color: kSecondaryColor),
      ),
      child: Image.asset(
        'assets/icons/$iconName.png',
        color: kSecondaryColor,
        width: largeIconSize,
      ),
    );
  }
}
