// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/trader_app/constants/colors.dart';

class TraderHomeElement extends StatelessWidget {
  final String iconName;
  final String title;
  final String value;
  final VoidCallback onTap;

  const TraderHomeElement({
    Key? key,
    required this.iconName,
    required this.onTap,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap,
      margin: EdgeInsets.only(bottom: kVPad),
      backgroundColor: kTraderLightColor,
      padding: EdgeInsets.symmetric(
        horizontal: kHPad / 1.5,
        vertical: kVPad / 1,
      ),
      width: double.infinity,
      borderRadius: 0,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/$iconName.png',
            width: largeIconSize,
            color: kTraderBlackColor,
          ),
          HSpace(),
          Text(
            title,
            style: h3TextStyle.copyWith(color: kTraderBlackColor),
          ),
          Spacer(),
          Text(
            value,
            style: h4LiteTextStyle.copyWith(color: kTraderBlackColor),
          )
        ],
      ),
    );
  }
}
