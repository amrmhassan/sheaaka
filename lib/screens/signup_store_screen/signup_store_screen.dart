// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_finish_store.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_store_info.dart';
import 'package:project/screens/signup_store_screen/widgets/signup_store_logo_upload.dart';

class SignUpStoreScreen extends StatefulWidget {
  static const String routeName = '/signup-store-screen';
  const SignUpStoreScreen({Key? key}) : super(key: key);

  @override
  State<SignUpStoreScreen> createState() => _SignUpStoreScreenState();
}

class _SignUpStoreScreenState extends State<SignUpStoreScreen> {
  Widget getSignupStep(int i, Function(int i) setActiveIndex) {
    if (i == 0) {
      return SignUpStoreInfo(
        setActiveSignUpStep: () => setActiveIndex(1),
      );
    } else if (i == 1) {
      return SingUpStoreLogoUpload(
        setActiveSignUpStep: () => setActiveIndex(2),
      );
    } else if (i == 2) {
      return SignUpFinishStore();
    }
    return SizedBox();
  }

  int activeStepIndex = 0;
  void setActiveIndex(int i) {
    setState(() {
      activeStepIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: getSignupStep(activeStepIndex, setActiveIndex),
    );
  }
}
