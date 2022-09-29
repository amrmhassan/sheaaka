// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/signup_screen/widgets/user_gender_element.dart';

class SignUpLastStep extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;
  final TextEditingController address;
  final TextEditingController birthDate;
  final UserGender userGender;
  final Function(UserGender g) setUserGender;
  final bool userAgree;
  final VoidCallback toggleUserAgree;

  const SignUpLastStep({
    Key? key,
    required this.setActiveSignUpStep,
    required this.address,
    required this.birthDate,
    required this.setUserGender,
    required this.userGender,
    required this.userAgree,
    required this.toggleUserAgree,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(
          iconName: 'patience',
          title: 'اخر خطوة',
        ),
        VSpace(factor: 2),
        PaddingWrapper(
          child: Row(
            children: [
              Text(
                'يمكنك تحديد موقعك تبقائيا من هنا',
                style: h5InactiveTextStyle,
              ),
              Image.asset(
                'assets/icons/pin.png',
                width: ultraSmallIconSize,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
        VSpace(factor: .2),
        CustomFormInput(
          controller: address,
          iconName: 'home2',
          title: 'عنوان المنزل',
          color: kSecondaryColor,
          borderColor: kSecondaryColor,
          trailingIconName: 'pin',
          trailingIconColor: kPrimaryColor,
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              Text(
                'قم باختيار موعد ميلادك من هنا',
                style: h5InactiveTextStyle,
              ),
              HSpace(factor: .2),
              Image.asset(
                'assets/icons/calendar.png',
                width: ultraSmallIconSize,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
        VSpace(factor: .2),
        CustomFormInput(
          controller: birthDate,
          iconName: 'birthday-cake',
          title: 'تاريخ الميلاد',
          color: kSecondaryColor,
          borderColor: kSecondaryColor,
          trailingIconName: 'calendar',
          trailingIconColor: kPrimaryColor,
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              UserGenderElement(
                active: userGender == UserGender.male,
                title: 'ذكر',
                onTap: () => setUserGender(UserGender.male),
              ),
              HSpace(),
              UserGenderElement(
                title: 'أنثي',
                active: userGender == UserGender.female,
                onTap: () => setUserGender(UserGender.female),
              ),
            ],
          ),
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              ProductCartCheckBox(
                checked: userAgree,
                onTap: toggleUserAgree,
              ),
              HSpace(factor: .3),
              Expanded(
                child: TitleSubtitle(
                  onTap: toggleUserAgree,
                  title: 'أوافق علي',
                  subTitle: 'الشروط والأحكام',
                  padding: EdgeInsets.zero,
                ),
              )
            ],
          ),
        ),
        VSpace(),
        SubmitFormButton(onTap: setActiveSignUpStep, title: 'تسجيل')
      ],
    );
  }
}
