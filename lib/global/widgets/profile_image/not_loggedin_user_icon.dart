// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';

class NotLoggedInUserIcon extends StatelessWidget {
  final String? imagePath;
  const NotLoggedInUserIcon({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        User? user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          Navigator.pushNamed(context, LoginScreen.routeName);
        } else {
          Navigator.pushNamed(context, ProfileScreen.routeName);
        }
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
            imagePath ?? 'assets/icons/user-avatar.png',
            width: mediumIconSize,
            height: mediumIconSize,
            fit: BoxFit.cover,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
