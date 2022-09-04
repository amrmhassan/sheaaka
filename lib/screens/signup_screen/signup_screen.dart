// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/signup_screen/widgets/signup_step1.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: PaddingWrapper(
        child: SignUpStep1(),
      ),
    );
  }
}
