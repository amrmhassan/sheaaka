// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class CategoryCustomerType extends StatelessWidget {
  final bool active;
  final String title;
  final VoidCallback? onTap;

  const CategoryCustomerType({
    required this.title,
    this.active = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: onTap ?? () {},
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kVPad / 4,
      ),
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : kSecondaryColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Text(
        title,
        style: h3LiteTextStyle.copyWith(
            color: active ? Colors.white : kSecondaryColor),
      ),
    );
  }
}
