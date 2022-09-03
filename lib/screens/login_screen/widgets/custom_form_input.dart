// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class CustomFormInput extends StatelessWidget {
  final String title;
  final String iconName;
  final String? trailingIconName;

  const CustomFormInput({
    Key? key,
    required this.iconName,
    required this.title,
    this.trailingIconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 2,
          // vertical: kVPad / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
          border: Border.all(width: 1, color: kBlackColor),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/$iconName.png',
              width: mediumIconSize,
              color: kBlackColor,
            ),
            HSpace(factor: .5),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title,
                  hintStyle: h3LiteTextStyle,
                ),
              ),
            ),
            if (trailingIconName != null)
              Image.asset(
                'assets/icons/$trailingIconName.png',
                width: mediumIconSize,
                color: kSecondaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
