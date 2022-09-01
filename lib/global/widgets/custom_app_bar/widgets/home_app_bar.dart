// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/home_app_bar_left_content.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.rightIcon,
    required this.title,
    required this.leftContent,
  }) : super(key: key);

  final Widget? rightIcon;
  final String? title;
  final Widget? leftContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: kHPad / 2,
        left: kHPad / 2,
        top: kVPad,
      ),
      child: Row(
        children: [
          rightIcon ??
              Text(
                title.toString(),
                style: h1TextStyle,
                textAlign: TextAlign.center,
              ),
          Spacer(),
          leftContent ?? HomeAppBarLeftContent(),
        ],
      ),
    );
  }
}
