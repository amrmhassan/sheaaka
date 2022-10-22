// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class PolicyElement extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PolicyElement({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: h4LiteTextStyle,
          ),
          HSpace(factor: .3),
          Image.asset(
            'assets/icons/left-arrow.png',
            width: smallIconSize,
          ),
        ],
      ),
    );
  }
}
