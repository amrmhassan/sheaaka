// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/home_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/inner_pages_app_bar.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool home;
  final Widget? rightIcon;
  final Widget? leftContent;
  final bool boundRightIconWidth;

  const CustomAppBar({
    Key? key,
    this.title,
    this.home = false,
    this.leftContent,
    this.rightIcon,
    this.boundRightIconWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return home
        ? HomeAppBar(
            rightIcon: rightIcon,
            title: title,
            leftContent: leftContent,
          )
        : InnerPagesAppBar(
            title: title,
            rightIcon: rightIcon,
            boundRightIconWidth: boundRightIconWidth,
          );
  }
}
