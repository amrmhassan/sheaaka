// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/navbar_icons_models.dart';

class NavBarItem extends StatelessWidget {
  final bool active;
  final NavBarIcon navBarIcon;
  final int index;
  final Function(int index) setActiveIndex;
  final Color? activeColor;
  final Color? inactiveColor;

  const NavBarItem({
    Key? key,
    this.active = false,
    required this.navBarIcon,
    required this.index,
    required this.setActiveIndex,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonWrapper(
        width: double.infinity,
        onTap: () => setActiveIndex(index),
        padding: EdgeInsets.all(largePadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(navBarIcon.isMain ? 500 : 0),
          color: navBarIcon.isMain ? kPrimaryColor : Colors.transparent,
        ),
        child: Image.asset(
          'assets/icons/${active ? navBarIcon.active : navBarIcon.inactive}.png',
          color: navBarIcon.isMain
              ? Colors.white
              : active
                  ? (activeColor ?? kPrimaryColor)
                  : (inactiveColor ?? kSecondaryColor),
          width: 30,
        ),
      ),
    );
  }
}
