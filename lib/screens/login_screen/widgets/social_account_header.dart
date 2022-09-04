// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';

class SocialAccountsHeader extends StatelessWidget {
  final String? title;
  final Color? color;

  const SocialAccountsHeader({
    Key? key,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HLine(
            width: 2,
            color: kSecondaryColor.withOpacity(.2),
          ),
        ),
        HSpace(factor: .5),
        Text(
          title ?? 'تسجيل باستخدام',
          style: h5LiteTextStyle.copyWith(color: color),
        ),
        HSpace(factor: .5),
        Expanded(
          child: HLine(
            width: 2,
            color: kSecondaryColor.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
