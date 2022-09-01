// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';

class CopyRights extends StatelessWidget {
  const CopyRights({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'جميع الحقوق محفوظة',
          style: h5LightTextStyle.copyWith(
            color: kSecondaryColor,
          ),
        ),
        VSpace(factor: .2),
        Text(
          'شياكة © 2022',
          style: h5LightTextStyle.copyWith(
            color: kSecondaryColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
