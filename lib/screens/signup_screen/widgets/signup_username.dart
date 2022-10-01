// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/form_promo_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/social_account_header.dart';
import 'package:project/screens/login_screen/widgets/social_button.dart';
import 'package:project/screens/signup_screen/widgets/email_type_switch.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/validation/signup_validation.dart';
import 'package:provider/provider.dart';

class SignUpUsername extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final UserRole userRole;
  final Function(UserRole userRole) setUserRole;
  final TextEditingController userNameController;
  final Function(SignMethod method) setSignMethod;
  final TextEditingController emailController;
  final String? profilePhoto;
  final Function(String? p) setProfilePhoto;
  final Function(GoogleSignInAccount p) setGoogleAccount;

  const SignUpUsername({
    Key? key,
    required this.incrementActiveIndex,
    required this.userRole,
    required this.userNameController,
    required this.setUserRole,
    required this.setSignMethod,
    required this.emailController,
    required this.profilePhoto,
    required this.setProfilePhoto,
    required this.setGoogleAccount,
  }) : super(key: key);

  @override
  State<SignUpUsername> createState() => _SignUpUsernameState();
}

class _SignUpUsernameState extends State<SignUpUsername> {
  String? userNameError;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(iconName: 'sign-up'),
        VSpace(factor: 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormPromoWithLogo(
              title: 'إنشاء حساب جديد',
            ),
            VSpace(),
            Text('نوع الحساب'),
            EmailTypeSwitch(
              userRole: widget.userRole,
              setUserRole: widget.setUserRole,
            ),
            VSpace(factor: 2),
            CustomTextField(
              errorText: userNameError,
              controller: widget.userNameController,
              iconName: 'user',
              title: 'اسم المستخدم',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
            ),
            VSpace(),
            SubmitFormButton(
              title: 'التالي',
              onTap: () {
                String? validator =
                    userNameValidation(widget.userNameController.text);
                if (validator == null) {
                  widget.incrementActiveIndex();
                } else {
                  setState(() {
                    userNameError = validator;
                  });
                }
              },
            ),
            VSpace(),
            SocialAccountsHeader(
              color: kInActiveTextColor,
            ),
            VSpace(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SocialButton(
                  title: 'Google',
                  iconName: 'google',
                  onTap: startSignUpWithGoogle,
                ),
                SocialButton(
                  title: 'Facebook',
                  iconName: 'facebook',
                  onTap: startSignUpWithFacebook,
                ),
              ],
            ),
            VSpace(),
            TitleSubtitle(
              title: 'لديك حساب',
              subTitle: 'تسجيل الدخول',
              textAlign: TextAlign.center,
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
            ),
          ],
        ),
        VSpace(),
      ],
    );
  }

  void startSignUpWithFacebook() {
    widget.setSignMethod(SignMethod.facebook);
    //* here just sign up with facebook
  }

  void startSignUpWithGoogle() async {
    widget.setSignMethod(SignMethod.google);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await Provider.of<UserProvider>(context, listen: false)
              .googleSignIn();

      if (googleSignInAccount == null) {
        return showSnackBar(context, 'لم يتم التسجيل', SnackBarType.error);
      }

      widget.setGoogleAccount(googleSignInAccount);
      String email = googleSignInAccount.email;
      String? name = googleSignInAccount.displayName;
      String? photoUrl = googleSignInAccount.photoUrl;
      widget.emailController.text = email;
      UserModel? userModel =
          await Provider.of<UserProvider>(context, listen: false)
              .getUserDataByEmail(email);
      if (userModel != null) {
        //* here the user is already signed up and i will sign him in to
        await Provider.of<UserProvider>(context, listen: false)
            .firebaseSignInGoogle(googleSignInAccount);
        showSnackBar(context, 'أنت بالفعل مسجل', SnackBarType.info);
        Navigator.pushReplacementNamed(context, HolderScreen.routeName);
      }

      widget.userNameController.text = name ?? '';
      widget.setProfilePhoto(photoUrl);
    } catch (e) {
      showSnackBar(context, e.toString(), SnackBarType.error);
    }
  }
}
