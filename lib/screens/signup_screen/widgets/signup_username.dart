// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/form_promo_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/social_account_header.dart';
import 'package:project/screens/login_screen/widgets/social_button.dart';
import 'package:project/screens/signup_screen/widgets/email_type_switch.dart';

class SignUpUsername extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;
  const SignUpUsername({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

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
            EmailTypeSwitch(),
            VSpace(factor: 2),
            CustomFormInput(
              iconName: 'user',
              title: 'اسم المستخدم',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
            ),
            VSpace(factor: 2),
            SubmitFormButton(
              title: 'التالي',
              onTap: setActiveSignUpStep,
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
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
