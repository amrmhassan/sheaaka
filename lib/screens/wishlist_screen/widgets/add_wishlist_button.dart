// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class AddWishListButton extends StatelessWidget {
  const AddWishListButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: kSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Image.asset(
        'assets/icons/plus.png',
        color: kSecondaryColor,
        width: mediumIconSize,
      ),
    );
  }
}
