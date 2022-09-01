// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class Brand extends StatelessWidget {
  const Brand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/adidas.png',
          width: smallIconSize,
          color: kSecondaryColor,
        ),
        HSpace(factor: .2),
        Text(
          'اديداس',
          style: h4TextStyleInactive,
        )
      ],
    );
  }
}
