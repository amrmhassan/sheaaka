// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String? iconPath;

  const EmptyWidget({
    Key? key,
    required this.title,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/no-task.png',
            width: ultraLargeIconSize,
            color: kSecondaryColor,
          ),
          VSpace(factor: .5),
          Text(
            title,
            style: h3InactiveTextStyle,
          ),
        ],
      ),
    );
  }
}
