// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: ButtonWrapper(
        padding: EdgeInsets.symmetric(vertical: kVPad / 2),
        backgroundColor: kBlackColor,
        onTap: () {
          Navigator.pushReplacementNamed(context, HolderScreen.routeName);
        },
        child: Text(
          'تسجيل الدخول',
          style: h3LiteTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
