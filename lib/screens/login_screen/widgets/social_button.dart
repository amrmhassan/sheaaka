// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class SocialButton extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTap;

  const SocialButton({
    Key? key,
    required this.iconName,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap,
      backgroundColor: Colors.transparent,
      child: PaddingWrapper(
        padding: EdgeInsets.symmetric(
          horizontal: kHPad,
          vertical: kVPad / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(mediumBorderRadius),
          border: Border.all(
            width: 1,
            color: kSecondaryColor.withOpacity(.2),
          ),
        ),
        child: Row(children: [
          Text(title, style: h3LiteTextStyle),
          HSpace(factor: .4),
          Image.asset(
            'assets/icons/$iconName.png',
            width: mediumIconSize,
          )
        ]),
      ),
    );
  }
}
