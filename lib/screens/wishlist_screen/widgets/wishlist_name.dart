// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class WishListName extends StatelessWidget {
  final String title;
  final bool active;

  const WishListName({
    Key? key,
    required this.title,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: active ? kPrimaryColor : kSecondaryColor.withOpacity(.1),
      onTap: () {},
      margin: EdgeInsets.only(left: kHPad / 2.5),
      padding: EdgeInsets.symmetric(
        horizontal: kHPad / 2,
        vertical: kHPad / 3,
      ),
      child: Text(
        title,
        style: h3TextStyle.copyWith(
          color: active ? Colors.white : kInActiveTextColor,
        ),
      ),
    );
  }
}
