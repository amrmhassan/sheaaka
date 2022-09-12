// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class StoreInfoElement extends StatelessWidget {
  final String info;
  const StoreInfoElement({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          info,
          style: h4LiteTextStyle.copyWith(decoration: TextDecoration.underline),
        ),
        ButtonWrapper(
          onTap: () {},
          padding: EdgeInsets.symmetric(
            horizontal: kHPad / 2,
            vertical: kVPad / 3,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(smallBorderRadius),
          ),
          child: Text(
            'نسخ',
            style: h4LiteTextStyle,
          ),
        )
      ],
    );
  }
}
