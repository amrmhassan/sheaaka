// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class ProductsNumber extends StatelessWidget {
  const ProductsNumber({
    Key? key,
    required this.number,
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
                  text: 'لديك',
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
                  text: 'منتج',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
