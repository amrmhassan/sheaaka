// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ProductTypeElement extends StatelessWidget {
  final bool active;
  final String title;

  const ProductTypeElement({
    Key? key,
    this.active = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      padding: EdgeInsets.symmetric(
        horizontal: kHPad / 2,
        vertical: kVPad / 3,
      ),
      margin: EdgeInsets.only(left: mediumPadding),
      onTap: () {},
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(smallBorderRadius),
        color: active ? kPrimaryColor : kSecondaryColor.withOpacity(.2),
      ),
      child: Text(
        title,
        style: h4LiteTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
