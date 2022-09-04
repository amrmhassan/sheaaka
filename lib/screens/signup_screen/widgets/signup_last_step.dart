// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';

class SignUpLastStep extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;

  const SignUpLastStep({
    Key? key,
    required this.setActiveSignUpStep,
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
                title: 'ذكر',
              ),
              HSpace(),
              UserGenderElement(
                title: 'أنثي',
                active: true,
              ),
            ],
          ),
        ),
        VSpace(),
        PaddingWrapper(
          child: Row(
            children: [
              ProductCartCheckBox(
                checked: true,
              ),
              HSpace(factor: .3),
              Expanded(
                child: TitleSubtitle(
                  onTap: () {},
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

class UserGenderElement extends StatelessWidget {
  final String title;
  final bool active;

  const UserGenderElement({
    Key? key,
    this.active = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: smallIconSize,
          height: smallIconSize,
          padding: EdgeInsets.all(smallPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            border: Border.all(
              width: 2,
              color: active ? kPrimaryColor : kSecondaryColor,
            ),
          ),
          child: active
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(500),
                  ),
                )
              : SizedBox(),
        ),
        HSpace(factor: .4),
        Text(
          title,
          style: h4TextStyle,
        ),
      ],
    );
  }
}
