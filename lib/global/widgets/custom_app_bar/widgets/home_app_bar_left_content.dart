// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/filters_icon.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/n_of_notifications.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';

class HomeAppBarLeftContent extends StatelessWidget {
  const HomeAppBarLeftContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
