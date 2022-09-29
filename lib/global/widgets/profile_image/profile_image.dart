// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/profile_image/loggedin_user_icon.dart';
import 'package:project/global/widgets/profile_image/not_loggedin_user_icon.dart';

class ProfileImage extends StatelessWidget {
  final double? radius;
  final Border? border;
  final EdgeInsets? padding;

  const ProfileImage({
    Key? key,
    this.border,
    this.padding,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data as User;
          return LoggedInUserIcon(
            radius: radius,
            padding: padding,
            border: border,
            imagePath: user.photoURL,
          );
        } else {
          return NotLoggedInUserIcon();
        }
      },
    );
  }
}
