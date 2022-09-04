// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SignUpEmailVerification extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;

  const SignUpEmailVerification({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(
          iconName: 'gmail',
          title: 'تأكيد الحساب',
        ),
        VSpace(factor: 3),
        PaddingWrapper(
          child: Text(
            'قم بالتحقق من برديك الاكتروني',
            style: h5InactiveTextStyle,
          ),
        ),
        VSpace(factor: .2),
        CustomFormInput(
          iconName: 'email - open',
          title: 'رمز التفعيل',
          color: kSecondaryColor,
          borderColor: kSecondaryColor,
        ),
        VSpace(),
        SubmitFormButton(
          onTap: setActiveSignUpStep,
          title: 'تأكيد',
        )
      ],
    );
  }
}
