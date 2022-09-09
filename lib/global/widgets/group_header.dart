// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class GroupHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const GroupHeader({
    Key? key,
    required this.onTap,
    required this.subTitle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad, vertical: kVPad / 2),
      onTap: onTap,
      backgroundColor: Colors.transparent,
      borderRadius: 0,
      child: Row(
        children: [
          Text(
            title,
            style: h2TextStyle,
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                subTitle,
                style: h4TextStyleInactive.copyWith(height: 1),
              ),
              Image.asset(
                'assets/icons/left-arrow.png',
                width: smallIconSize,
                color: kSecondaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
