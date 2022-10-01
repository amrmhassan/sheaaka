// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        //! never remove this builder cause it make an error in the children widgets
        //! cause i am not checking if the user is logged in or not in them
        if (snapshot.hasData) {
          return LoggedInUserIcon(
            radius: radius,
            padding: padding,
            border: border,
          );
        } else {
          return NotLoggedInUserIcon();
        }
      },
    );
  }
}
