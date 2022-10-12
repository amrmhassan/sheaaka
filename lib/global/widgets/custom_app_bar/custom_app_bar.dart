// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/home_app_bar_left_content.dart';
import 'package:project/trader_app/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool home;
  final Widget? rightIcon;
  final List<Widget>? leftContent;
  final bool boundRightIconWidth;
  final bool traderStyle;

  const CustomAppBar({
    Key? key,
    this.title,
    this.home = false,
    this.leftContent,
    this.rightIcon,
    this.boundRightIconWidth = false,
    this.traderStyle = false,
  }) : super(key: key);

  Widget getAppBarChild(BuildContext context) {
    return Row(
      children: [
        rightIcon != null
            ? SizedBox(
                width: roundIconRadius,
                child: rightIcon,
              )
            : SizedBox(
                width: roundIconRadius,
              ),
        Expanded(
          child: Text(
            title ?? '',
            style: h1TextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        AppBarIcon(
          backgroundColor:
              traderStyle ? kTraderLightColor.withOpacity(.5) : null,
          iconName: 'arrow',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return home
        ? Container(
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
                HomeAppBarLeftContent(
                  leftContent: leftContent,
                ),
              ],
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              right: kHPad / 2,
              left: kHPad / 2,
              top: kVPad,
            ),
            child: getAppBarChild(context),
          );
  }
}
