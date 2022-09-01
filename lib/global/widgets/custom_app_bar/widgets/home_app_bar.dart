// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/filters_icon.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/n_of_notifications.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.rightIcon,
    required this.title,
    required this.leftContent,
  }) : super(key: key);

  final Widget? rightIcon;
  final String? title;
  final Widget? leftContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: kHPad / 2,
        left: kHPad / 2,
        top: kVPad,
      ),
      child: Row(
        children: [
          rightIcon ??
              Text(
                title.toString(),
                style: h1TextStyle,
                textAlign: TextAlign.center,
              ),
          Spacer(),
          leftContent ??
              Row(
                children: [
                  FiltersIcon(),
                  HSpace(
                    factor: 1.8,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    clipBehavior: Clip.none,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      //! this gesture detector was only for testing just remove it
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child: ProfileImage(),
                      ),
                      NOfNotifications(),
                    ],
                  ),
                ],
              )
        ],
      ),
    );
  }
}
