// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/signup_congrats.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_password.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_verfication.dart';
import 'package:project/screens/signup_screen/widgets/signup_last_step.dart';
import 'package:project/screens/signup_screen/widgets/signup_user_photo_upload.dart';
import 'package:project/screens/signup_screen/widgets/signup_username.dart';

Widget getSignupStep(int i, Function(int i) setActiveIndex) {
  if (i == 0) {
    return SignUpUsername(
      setActiveSignUpStep: () => setActiveIndex(1),
    );
  } else if (i == 1) {
    return SignUpEmailPassword(
      setActiveSignUpStep: () => setActiveIndex(2),
    );
  } else if (i == 2) {
    return SignUpEmailVerification(
      setActiveSignUpStep: () => setActiveIndex(3),
    );
  } else if (i == 3) {
    return SignUpUserPhotoUpload(
      setActiveSignUpStep: () => setActiveIndex(4),
    );
  } else if (i == 4) {
    return SignUpLastStep(
      setActiveSignUpStep: () => setActiveIndex(5),
    );
  } else {
    return SignUpCongrats();
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int activeStepIndex = 0;
  void setActiveIndex(int i) {
    setState(() {
      activeStepIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: PaddingWrapper(
        child: getSignupStep(activeStepIndex, setActiveIndex),
      ),
    );
  }
}
