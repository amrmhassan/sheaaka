// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class SubmitFormButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  const SubmitFormButton({
    Key? key,
    required this.onTap,
    this.padding,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: padding ?? EdgeInsets.symmetric(horizontal: kHPad),
      child: ButtonWrapper(
        padding: EdgeInsets.symmetric(vertical: kVPad / 2),
        backgroundColor: kBlackColor,
        onTap: onTap,
        child: Text(
          title,
          style: h3LiteTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
