// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ApplyCouponButton extends StatelessWidget {
  const ApplyCouponButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      width: 80,
      backgroundColor: kPrimaryColor,
      borderRadius: mediumBorderRadius,
      child: Text(
        'تطبيق',
        style: h2LightTextStyle,
      ),
    );
  }
}
