// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/login_screen/login_screen.dart';

class NotLoggedInUserIcon extends StatelessWidget {
  const NotLoggedInUserIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, LoginScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(mediumPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          border: Border.all(
            width: 2,
            color: kSecondaryColor,
          ),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
          ),
          child: Image.asset(
            'assets/icons/user-avatar.png',
            width: largeIconSize,
            height: largeIconSize,
            fit: BoxFit.cover,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
