// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/global/widgets/full_loading_screen.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/signup_congrats.dart';
import 'package:project/screens/signup_screen/widgets/signup_email_password.dart';
import 'package:project/screens/signup_screen/widgets/signup_last_step.dart';
import 'package:project/screens/signup_screen/widgets/signup_user_photo_upload.dart';
import 'package:project/screens/signup_screen/widgets/signup_username.dart';
import 'package:project/utils/auth_exception_utils.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignMethod signMethod = SignMethod.email;
  void setSignMethod(SignMethod method) {
    setState(() {
      signMethod = method;
    });
  }

  //? google account
  GoogleSignInAccount? googleSignInAccount;
  void setGoogleAccount(GoogleSignInAccount g) {
    setState(() {
      googleSignInAccount = g;
    });
  }

  //? signing up
  bool signingUp = false;

  //? submitting user info to firebase auth
  Future<void> submitUserDate() async {
    setState(() {
      signingUp = true;
    });
    try {
      await Provider.of<UserProvider>(context, listen: false).signUserUp(
        email: emailController.text,
        password: passwordController.text,
        phone: phoneNumberController.text,
        address: addressController.text,
        birthDate: birthDate,
        location: location,
        userGender: userGender,
        userRole: userRole,
        userProfilePhoto: profileImage,
        userName: userNameController.text,
        signMethod: signMethod,
        googleSignInAccount: googleSignInAccount,
      );
      showSnackBar(context, 'تم التسجيل بنجاح', SnackBarType.success);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, getReadableErrorMessage(e), SnackBarType.error);
    }
    setState(() {
      signingUp = false;
    });
  }

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

  //? for user gender
  UserGender userGender = UserGender.male;
  void setUserGender(UserGender g) async {
    setState(() {
      userGender = g;
    });
  }

  //? other user info
  bool userAgree = false;
  void toggleUserAgree() {
    setState(() {
      userAgree = !userAgree;
    });
  }

//? for birth date
  DateTime? birthDate;
  void setBirthDate(DateTime d) {
    setState(() {
      birthDate = d;
    });
  }

//? for location
  LatLng? location;
  void setLocation(LatLng l) {
    setState(() {
      location;
    });
  }

//? user photo
  String? profileImage;
  void setProfilePhoto(String? p) {
    setState(() {
      profileImage = p;
    });
  }

//? handle viewing the current signup step
  Widget getSignupStep(int i) {
    if (i == 0) {
      return SignUpUsername(
        setSignMethod: setSignMethod,
        incrementActiveIndex: incrementActiveIndex,
        userRole: userRole,
        setUserRole: setUserRole,
        userNameController: userNameController,
        emailController: emailController,
        profilePhoto: profileImage,
        setProfilePhoto: setProfilePhoto,
        setGoogleAccount: setGoogleAccount,
      );
    } else if (i == 1) {
      return SignUpEmailPassword(
        email: emailController,
        password: passwordController,
        passwordConfirm: passwordConfirmController,
        phone: phoneNumberController,
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
        signMethod: signMethod,
      );
    }
    //! i won't enable this right now cause it will need some more work
    // else if (i == 2) {
    //   return SignUpEmailVerification(
    //     incrementActiveIndex: incrementActiveIndex,
    //     decrementActiveIndex: decrementActiveIndex,
    //   );
    // }
    else if (i == 2) {
      return SignUpUserPhotoUpload(
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
        setProfilePhoto: setProfilePhoto,
        profileImage: profileImage,
      );
    } else if (i == 3) {
      return SignUpLastStep(
        address: addressController,
        birthDate: birthDate,
        userGender: userGender,
        setUserGender: setUserGender,
        incrementActiveIndex: incrementActiveIndex,
        decrementActiveIndex: decrementActiveIndex,
        userAgree: userAgree,
        toggleUserAgree: toggleUserAgree,
        signUserUp: submitUserDate,
        setBirthDate: setBirthDate,
        setLocation: setLocation,
        location: location,
      );
    } else {
      return SignUpCongrats(
        userRole: userRole,
        userPhoto: profileImage,
      );
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
          child: signingUp
              ? FullLoadingScreen(title: 'جاري التسجيل')
              : SingleChildScrollView(
                  child: getSignupStep(activeStepIndex),
                ),
        ),
      ),
    );
  }
}
