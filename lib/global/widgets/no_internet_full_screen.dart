// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';

class NoInternetFullScreen extends StatelessWidget {
  const NoInternetFullScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity),
        Image.asset(
          'assets/icons/no-signal.png',
          width: largeIconSize * 2,
          color: kSecondaryColor,
        ),
        VSpace(factor: .5),
        Text(
          'لابد من وجود اتصال بالانترنت في أول مرة',
          style: h3InactiveTextStyle,
        ),
      ],
    );
  }
}
