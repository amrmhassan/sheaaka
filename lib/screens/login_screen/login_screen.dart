// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/login_screen/widgets/title_subtitle.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/form_promo_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/screens/login_screen/widgets/social_account_header.dart';
import 'package:project/screens/login_screen/widgets/social_button.dart';
import 'package:project/screens/signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String routeName = '/login-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (n) {
          n.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: PaddingWrapper(
            height: Responsive.getCleanHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VSpace(),
                FormHeaderWithLogo(
                  iconName: 'login',
                  title: 'شياكة',
                ),
                VSpace(factor: 2),
                Column(
                  children: [
                    FormPromoWithLogo(
                      title: 'تسجيل الدخول',
                    ),
                    VSpace(factor: .5),
                    CustomTextField(
                      title: 'الايميل',
                      iconName: 'mail',
                    ),
                    VSpace(factor: .5),
                    CustomTextField(
                      title: 'الرقم السري',
                      iconName: 'key',
                      trailingIconName: 'view',
                    ),
                    VSpace(),
                    SubmitFormButton(
                      title: 'تسجيل الدخول',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, HolderScreen.routeName);
                      },
                    ),
                    VSpace(),
                    TitleSubtitle(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.routeName);
                      },
                    ),
                  ],
                ),
                VSpace(factor: 2),
                Column(
                  children: [
                    SocialAccountsHeader(),
                    VSpace(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialButton(
                          title: 'Google',
                          iconName: 'google',
                          onTap: () {},
                        ),
                        SocialButton(
                          title: 'Facebook',
                          iconName: 'facebook',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                VSpace(factor: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
