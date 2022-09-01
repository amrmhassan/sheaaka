// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ProductCartQuantityControllerButton extends StatelessWidget {
  final String iconPath;
  const ProductCartQuantityControllerButton({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      width: 25,
      height: 25,
      borderRadius: 100,
      padding: EdgeInsets.all(mediumPadding),
      backgroundColor: kSecondaryColor.withOpacity(0.1),
      onTap: () {},
      child: Image.asset(
        iconPath,
        color: kBlackColor,
      ),
    );
  }
}
