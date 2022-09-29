// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/form_promo_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/social_account_header.dart';
import 'package:project/screens/login_screen/widgets/social_button.dart';
import 'package:project/screens/signup_screen/widgets/email_type_switch.dart';
import 'package:project/validation/signup_validation.dart';

class SignUpUsername extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final UserRole userRole;
  final Function(UserRole userRole) setUserRole;
  final TextEditingController userNameController;

  const SignUpUsername({
    Key? key,
    required this.incrementActiveIndex,
    required this.userRole,
    required this.userNameController,
    required this.setUserRole,
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
                  onTap: () {},
                ),
                SocialButton(
                  title: 'Facebook',
                  iconName: 'facebook',
                  onTap: () {},
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
}
