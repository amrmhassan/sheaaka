// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: h4LiteTextStyle.copyWith(color: kActiveTextColor),
            children: [
              TextSpan(
                text: 'ليس لديك حساب ؟',
              ),
              TextSpan(text: '  '),
              TextSpan(
                text: 'تسجيل حساب جديد',
                style: h4TextStyle.copyWith(
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
