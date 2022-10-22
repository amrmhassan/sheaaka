// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final String title;

  const CategoryItem({
    Key? key,
    required this.iconPath,
    this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap ?? () {},
      padding: EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad / 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        color: kSecondaryColor.withOpacity(.1),
      ),
      child: Row(
        children: [
          Image.asset(iconPath),
          HSpace(factor: .7),
          Text(
            title,
            style: h3TextStyle,
          ),
        ],
      ),
    );
  }
}
