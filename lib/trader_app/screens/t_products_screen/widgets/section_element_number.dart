// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class SectionElementsNumber extends StatelessWidget {
  final String? leadingTitle;
  final String? trailingTitle;

  const SectionElementsNumber({
    Key? key,
    required this.number,
    this.leadingTitle,
    this.trailingTitle,
  }) : super(key: key);
  final int number;

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              style: h4TextStyleInactive.copyWith(
                color: kTraderBlackColor,
              ),
              children: [
                TextSpan(
                  text: leadingTitle ?? 'لديك',
                ),
                TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: number.toString(),
                  style: h4TextStyle.copyWith(color: kTraderPrimaryColor),
                ),
                TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: trailingTitle ?? 'منتج',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
