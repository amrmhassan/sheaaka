// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/signup_screen/widgets/back_step_form_button.dart';
import 'package:project/screens/signup_screen/widgets/email_type_switch.dart';
import 'package:project/validation/signup_validation.dart';

class SignUpEmailPassword extends StatefulWidget {
  final VoidCallback incrementActiveIndex;
  final VoidCallback decrementActiveIndex;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController passwordConfirm;
  final TextEditingController phone;

  const SignUpEmailPassword({
    Key? key,
    required this.incrementActiveIndex,
    required this.decrementActiveIndex,
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

  void handleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void handleShowPasswordConfirmation() {
    setState(() {
      showPasswordConfirmation = !showPasswordConfirmation;
    });
  }

  String? emailError;
  String? passwordError;
  String? passConfirmError;
  String? phoneError;

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
            CustomTextField(
              controller: widget.email,
              iconName: 'email',
              title: 'الايميل',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              textInputType: TextInputType.emailAddress,
              errorText: emailError,
            ),
            VSpace(factor: .5),
            CustomTextField(
              controller: widget.password,
              iconName: 'key',
              title: 'الرقم السري',
              password: !showPassword,
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
              textInputType: TextInputType.visiblePassword,
              handleShowPassword: handleShowPassword,
              errorText: passwordError,
            ),
            VSpace(factor: .5),
            CustomTextField(
              controller: widget.passwordConfirm,
              iconName: 'key',
              title: 'تأكيد الرقم السري',
              password: !showPasswordConfirmation,
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              trailingIconName: 'view',
              textInputType: TextInputType.visiblePassword,
              handleShowPassword: handleShowPasswordConfirmation,
              errorText: passConfirmError,
            ),
            VSpace(factor: .5),
            CustomTextField(
              controller: widget.phone,
              iconName: 'smartphone',
              title: 'رقم الهاتف',
              color: kSecondaryColor,
              borderColor: kSecondaryColor,
              errorText: phoneError,
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
        SubmitFormButton(
            onTap: () {
              String? emailV = emailValidation(widget.email.text);
              String? passV = passwordValidation(widget.password.text);
              String? passConfirmV = passConfirmValidation(
                  widget.passwordConfirm.text, widget.password.text);
              String? phoneV = phoneValidation(widget.phone.text);
              setState(() {
                emailError = emailV;
                passwordError = passV;
                passConfirmError = passConfirmV;
                phoneError = phoneV;
              });
              if (emailError == null &&
                  passwordError == null &&
                  passConfirmError == null &&
                  phoneError == null) {
                widget.incrementActiveIndex();
              }
            },
            title: 'التالي'),
        BackStepFormButton(onTap: widget.decrementActiveIndex),
        Spacer(),
      ],
    );
  }
}
