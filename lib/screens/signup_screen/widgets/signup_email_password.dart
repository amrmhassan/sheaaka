// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SignUpEmailPassword extends StatefulWidget {
  final VoidCallback setActiveSignUpStep;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController passwordConfirm;
  final TextEditingController phone;

  const SignUpEmailPassword({
    Key? key,
    required this.setActiveSignUpStep,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required this.phone,
  }) : super(key: key);

  @override
  State<SignUpEmailPassword> createState() => _SignUpEmailPasswordState();
}

class _SignUpEmailPasswordState extends State<SignUpEmailPassword> {
  bool showPassword = false;
  bool showPasswordConfirmation = false;

  void handlePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void handlePasswordConfirmation() {
    setState(() {
      showPasswordConfirmation = !showPasswordConfirmation;
    });
  }

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
              controller: widget.email,
              iconName: 'email',
              title: 'الايميل',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              textInputType: TextInputType.emailAddress,
            ),
            VSpace(factor: .5),
            CustomFormInput(
              controller: widget.password,
              iconName: 'key',
              title: 'الرقم السري',
              password: !showPassword,
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
              textInputType: TextInputType.visiblePassword,
              handleShowPassword: handlePassword,
            ),
            VSpace(factor: .5),
            CustomFormInput(
              controller: widget.passwordConfirm,
              iconName: 'key',
              title: 'تأكيد الرقم السري',
              password: !showPasswordConfirmation,
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
              textInputType: TextInputType.visiblePassword,
              handleShowPassword: handlePasswordConfirmation,
            ),
            VSpace(factor: .5),
            CustomFormInput(
              controller: widget.phone,
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
        SubmitFormButton(onTap: widget.setActiveSignUpStep, title: 'التالي'),
        Spacer(),
      ],
    );
  }
}
