// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class FollowStore extends StatelessWidget {
  const FollowStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: Colors.transparent,
      borderRadius: 500,
      padding: EdgeInsets.all(largePadding),
      child: Image.asset(
        'assets/icons/follow-store.png',
        width: mediumIconSize,
        color: kBlackColor,
      ),
    );
  }
}
