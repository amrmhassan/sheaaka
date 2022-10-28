// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/trader_app/constants/colors.dart';

class AddingProductAdvice extends StatelessWidget {
  final String iconPath;
  const AddingProductAdvice({Key? key, required this.iconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'عند الانتهاء قم برفع المنتج من الزر بالأعلي',
          style: h4TextStyleInactive.copyWith(
            color: kTraderSecondaryColor,
          ),
        ),
        HSpace(factor: .1),
        Image.asset(
          iconPath,
          width: smallIconSize,
          color: kTraderSecondaryColor,
        ),
      ],
    );
  }
}
