// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class TStoreProfileScreen extends StatelessWidget {
  static const String routeName = '/t-store-profile-screen';
  const TStoreProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            home: false,
            title: 'متجري',
            traderStyle: true,
          ),
          VSpace(),
          PaddingWrapper(
            child: ButtonWrapper(
              padding: EdgeInsets.symmetric(
                  horizontal: kHPad / 2, vertical: kVPad / 2),
              child: Text(
                'تصفح المنتجات',
                style: h3LightTextStyle,
              ),
              onTap: () {
                Navigator.pushNamed(context, HolderScreen.routeName,
                    arguments: false);
              },
            ),
          )
        ],
      ),
    );
  }
}
