// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/signup_congrats.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_password.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_verification.dart';
import 'package:project/screens/signup_screen/widgets/signup_last_step.dart';
import 'package:project/screens/signup_screen/widgets/signup_user_photo_upload.dart';
import 'package:project/screens/signup_screen/widgets/signup_username.dart';

//! the validation runs on each sign up step by running the validation before going to the next step

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //? handling the current step in signing a user up
  int activeStepIndex = 0;

  void incrementActiveIndex() {
    setState(() {
      activeStepIndex++;
    });
  }

  void decrementActiveIndex() {
    setState(() {
      activeStepIndex--;
    });
  }

  //? for handing the current user email type
  UserRole userRole = UserRole.normal;
  void setUserRole(UserRole u) {
    setState(() {
      userRole = u;
    });
  }

  //? text fields controllers
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  //? for user gender
  UserGender userGender = UserGender.male;
  void setUserGender(UserGender g) {
    setState(() {
      userGender = g;
    });
  }

  //? acceptance of user agreement
  bool userAgree = false;
  void toggleUserAgree() {
    setState(() {
      userAgree = !userAgree;
    });
  }

  Widget getSignupStep(int i) {
    if (i == 0) {
      return SignUpUsername(
        incrementActiveIndex: incrementActiveIndex,
        userRole: userRole,
        setUserRole: setUserRole,
        userNameController: userNameController,
      );
    } else if (i == 1) {
      return SignUpEmailPassword(
        email: emailController,
        password: passwordController,
        passwordConfirm: passwordConfirmController,
        phone: phoneNumberController,
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
      );
    } else if (i == 2) {
      return SignUpEmailVerification(
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
      );
    } else if (i == 3) {
      return SignUpUserPhotoUpload(
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
      );
    } else if (i == 4) {
      return SignUpLastStep(
        address: addressController,
        birthDate: birthDateController,
        userGender: userGender,
        setUserGender: setUserGender,
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
        userAgree: userAgree,
        toggleUserAgree: toggleUserAgree,
      );
    } else {
      return SignUpCongrats();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: PaddingWrapper(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (n) {
            n.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: getSignupStep(activeStepIndex),
          ),
        ),
      ),
    );
  }
}
