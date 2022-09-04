// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class FormPromoWithLogo extends StatelessWidget {
  final String title;

  const FormPromoWithLogo({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/user1.png',
          width: mediumIconSize,
          color: kPrimaryColor,
        ),
        HSpace(factor: .5),
        Text(
          title,
          style: h3TextStyle,
        )
      ],
    );
  }
}
