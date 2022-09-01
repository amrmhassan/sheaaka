// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class StartSearchButton extends StatelessWidget {
  const StartSearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: Colors.transparent,
      borderRadius: 0,
      padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
      child: RichText(
        text: TextSpan(
          style: h3LiteTextStyle.copyWith(color: kActiveTextColor),
          children: [
            TextSpan(text: 'بحث عن'),
            TextSpan(text: " "),
            TextSpan(
              text: '" تشيرت أحمر "',
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
