// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/trader_app/constants/colors.dart';

class NumberOfProductPhotos extends StatelessWidget {
  const NumberOfProductPhotos({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: h4TextStyleInactive.copyWith(
          color: kTraderBlackColor,
        ),
        children: [
          TextSpan(text: 'يوجد'),
          TextSpan(text: ' '),
          TextSpan(
            text: number.toString(),
            style: h4TextStyle.copyWith(
              color: kTraderPrimaryColor,
            ),
          ),
          TextSpan(text: ' '),
          TextSpan(text: 'صور'),
        ],
      ),
    );
  }
}
