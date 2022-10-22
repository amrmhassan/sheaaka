// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';

class AllFiltersButton extends StatelessWidget {
  const AllFiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      borderRadius: 0,
      padding: EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kHPad / 2),
      onTap: () {},
      backgroundColor: Colors.transparent,
      child: Row(
        children: [
          Image.asset(
            'assets/icons/filter1.png',
            width: smallIconSize,
          ),
          HSpace(factor: .3),
          Text(
            'الكل',
            style: h4LiteTextStyle,
          )
        ],
      ),
    );
  }
}
