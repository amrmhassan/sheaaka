// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class DontHaveAccount extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextAlign? textAlign;
  final VoidCallback onTap;

  const DontHaveAccount({
    Key? key,
    this.textAlign,
    this.subTitle,
    this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: onTap,
          child: RichText(
            textAlign: textAlign ?? TextAlign.start,
            text: TextSpan(
              style: h4LiteTextStyle.copyWith(color: kActiveTextColor),
              children: [
                TextSpan(
                  text: title ?? 'ليس لديك حساب ؟',
                ),
                TextSpan(text: '  '),
                TextSpan(
                  text: subTitle ?? 'تسجيل حساب جديد',
                  style: h4TextStyle.copyWith(
                    color: kPrimaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
