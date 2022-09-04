// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';

class SignUpUserPhotoUpload extends StatelessWidget {
  final VoidCallback setActiveSignUpStep;

  const SignUpUserPhotoUpload({
    Key? key,
    required this.setActiveSignUpStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
        ),
        VSpace(factor: 2),
        Text(
          'صورة المستخدم',
          style: h1TextStyle,
        ),
        VSpace(factor: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(smallPadding),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(
                        width: 1,
                        color: kSecondaryColor,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/profile.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    padding: EdgeInsets.all(smallPadding),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.3),
                      borderRadius: BorderRadius.circular(500),
                    ),
                  ),
                  Opacity(
                    opacity: .7,
                    child: Image.asset(
                      'assets/icons/upload.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          'قم بإضافة صورة حتي يبدو حسابك بشكل أفضل',
          style: h5InactiveTextStyle,
        ),
        VSpace(),
        SubmitFormButton(onTap: setActiveSignUpStep, title: 'التالي'),
      ],
    );
  }
}
