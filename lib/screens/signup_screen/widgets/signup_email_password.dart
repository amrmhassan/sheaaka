// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SignUpEmailPassword extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;

  const SignUpEmailPassword({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(
          iconName: 'programmer',
          title: 'معلومات الدخول',
        ),
        VSpace(factor: 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaddingWrapper(
              child: Text(
                'سيتم تأكيد البريد في الخطوة التالية',
                style: h5InactiveTextStyle,
              ),
            ),
            CustomFormInput(
              iconName: 'email',
              title: 'الايميل',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
            ),
            VSpace(factor: .5),
            CustomFormInput(
              iconName: 'key',
              title: 'الرقم السري',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
            ),
            VSpace(factor: .5),
            CustomFormInput(
              iconName: 'key',
              title: 'تأكيد الرقم السري',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
            ),
            VSpace(factor: .5),
            CustomFormInput(
              iconName: 'smartphone',
              title: 'رقم الهاتف',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              //? don't use this cause all numbers will be from egypt
              // trailingIconWidget: Row(
              //   children: [
              //     Image.asset(
              //       'assets/icons/arrow-down-sign-to-navigate.png',
              //       width: ultraSmallIconSize,
              //     ),
              //     Text(
              //       '+20',
              //       style: h3TextStyle,
              //     )
              //   ],
              // ),
            ),
          ],
        ),
        VSpace(),
        SubmitFormButton(onTap: setActiveSignUpStep, title: 'التالي'),
        Spacer(),
      ],
    );
  }
}
