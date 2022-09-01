// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class FiltersIcon extends StatelessWidget {
  const FiltersIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      width: mediumIconSize + largePadding * 2,
      height: mediumIconSize + largePadding * 2,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(largePadding),
      child: Image.asset(
        'assets/icons/filter.png',
        color: kBlackColor,
        width: mediumIconSize,
        height: mediumIconSize,
      ),
    );
  }
}
