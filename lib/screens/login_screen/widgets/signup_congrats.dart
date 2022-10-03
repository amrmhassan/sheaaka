// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';

class SignUpCongrats extends StatelessWidget {
  final UserRole userRole;
  const SignUpCongrats({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpace(factor: 3),
        FormHeaderWithLogo(
          iconName: 'welcome-back',
          title: 'تم تسجيل حسابك بنجاح',
        ),
        VSpace(factor: 2),
        userRole != UserRole.trader
            ? PaddingWrapper(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VSpace(),
                    TitleSubtitle(
                      padding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpStoreScreen.routeName);
                      },
                      title: 'هل أنت تاجر؟ ',
                      subTitle: 'إنشاء متجر',
                    )
                  ],
                ),
              )
            : PaddingWrapper(
                child: Column(
                children: [
                  Text(
                    'حان وقت إنشاء متجرك الخاص',
                    style: h4TextStyleInactive,
                  )
                ],
              )),
        VSpace(factor: .5),
        userRole != UserRole.trader
            ? SubmitFormButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, HolderScreen.routeName);
                },
                title: 'فتح',
              )
            : SubmitFormButton(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, SignUpStoreScreen.routeName);
                },
                title: 'إنشاء متجرك',
              ),
      ],
    );
  }
}
