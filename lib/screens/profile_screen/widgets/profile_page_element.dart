// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/profile_screen/widgets/notifying_box.dart';

class ProfilePageElement extends StatelessWidget {
  final String iconName;
  final String title;
  final VoidCallback onTap;
  final String? notifyTitle;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const ProfilePageElement({
    Key? key,
    required this.iconName,
    required this.onTap,
    required this.title,
    this.notifyTitle,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap,
      backgroundColor: backgroundColor ?? Colors.transparent,
      padding: padding ??
          EdgeInsets.symmetric(vertical: kVPad / 2, horizontal: kHPad / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/$iconName.png',
            width: mediumIconSize,
            color: kBlackColor,
          ),
          HSpace(factor: .5),
          Text(
            title,
            style: h3LiteTextStyle,
          ),
          Spacer(),
          if (notifyTitle != null)
            NotifyingBox(
              title: notifyTitle!,
            ),
          Image.asset(
            'assets/icons/left-arrow.png',
            width: mediumIconSize,
          )
        ],
      ),
    );
  }
}
