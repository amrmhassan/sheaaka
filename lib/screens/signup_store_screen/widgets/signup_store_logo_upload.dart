// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SingUpStoreLogoUpload extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;

  const SingUpStoreLogoUpload({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: kBlackColor),
              child: Text(
                'قم باختيار صورة غلاف',
                style: h3TextStyle.copyWith(color: kLightColor),
              ),
            ),
            Positioned(
              bottom: -50,
              right: largePadding,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(largePadding * 2),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(width: 1, color: kSecondaryColor),
                      color: Colors.white,
                    ),
                    child: Opacity(
                      opacity: .2,
                      child: Image.asset(
                        'assets/icons/user.png',
                        color: kBlackColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    padding: EdgeInsets.all(largePadding * 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: Image.asset(
                      'assets/icons/camera.png',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: largePadding * 2,
              bottom: largePadding,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kHPad / 2, vertical: kVPad / 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(smallBorderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/icons/camera.png',
                      width: smallIconSize,
                    ),
                    HSpace(factor: .3),
                    Text(
                      'إضافة صورة',
                      style: h4LiteTextStyle,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        VSpace(factor: 5),
        Text(
          'صورة اللوجو والغلاف تساعد الزبائن في التعرف علي متجرك',
          style: h4TextStyle.copyWith(color: kInActiveTextColor),
        ),
        VSpace(factor: 5),
        SubmitFormButton(onTap: setActiveSignUpStep, title: 'التالي')
      ],
    );
  }
}
