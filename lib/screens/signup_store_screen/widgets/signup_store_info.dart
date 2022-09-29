// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SignUpStoreInfo extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;
  const SignUpStoreInfo({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 3),
          FormHeaderWithLogo(
            iconName: 'clothing-shop',
            title: 'معلمومات التاجر',
          ),
          VSpace(factor: 2),
          CustomTextField(
            iconName: 'shop',
            title: 'اسم المحل',
            padding: EdgeInsets.zero,
          ),
          VSpace(),
          CustomTextField(
            padding: EdgeInsets.zero,
            iconName: 'shop',
            title: 'عنوان المحل',
            trailingIconColor: kPrimaryColor,
            trailingIconName: 'pin',
          ),
          VSpace(),
          StoreContactsElement(
            iconName: 'telephone',
            title: 'ارقام المحل',
          ),
          VSpace(),
          StoreContactsElement(
            iconName: 'email',
            title: 'ايميلات المحل',
          ),
          VSpace(),
          SubmitFormButton(
            onTap: setActiveSignUpStep,
            title: 'التالي',
            padding: EdgeInsets.zero,
          )
        ],
      ),
    );
  }
}

class StoreContactsElement extends StatelessWidget {
  final String title;
  final String iconName;

  const StoreContactsElement({
    Key? key,
    required this.iconName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            padding: EdgeInsets.zero,
            iconName: iconName,
            title: title,
            trailingIconName: 'down-arrow',
            trailingIconColor: kBlackColor,
          ),
        ),
        HSpace(factor: 1),
        Container(
          padding: EdgeInsets.all(largePadding),
          width: mediumIconSize * 1.5,
          height: mediumIconSize * 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            border: Border.all(width: 1, color: kBlackColor),
          ),
          child: Image.asset(
            'assets/icons/plus.png',
            color: kBlackColor,
          ),
        )
      ],
    );
  }
}
