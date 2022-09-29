// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/signup_congrats.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_password.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_verfication.dart';
import 'package:project/screens/signup_screen/widgets/signup_last_step.dart';
import 'package:project/screens/signup_screen/widgets/signup_user_photo_upload.dart';
import 'package:project/screens/signup_screen/widgets/signup_username.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //? handling the current step in signing a user up
  int activeStepIndex = 0;
  void setActiveIndex(int i) {
    //! here the for validation will take place with showSnackBar
    setState(() {
      activeStepIndex = i;
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

  Widget getSignupStep(int i, Function(int i) setActiveIndex) {
    if (i == 0) {
      return SignUpUsername(
        setActiveSignUpStep: () => setActiveIndex(1),
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
        address: addressController,
        birthDate: birthDateController,
        userGender: userGender,
        setUserGender: setUserGender,
        setActiveSignUpStep: () => setActiveIndex(5),
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
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (n) {
          n.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: PaddingWrapper(
            height: Responsive.getCleanHeight(context),
            child: getSignupStep(activeStepIndex, setActiveIndex),
          ),
        ),
      ),
    );
  }
}
