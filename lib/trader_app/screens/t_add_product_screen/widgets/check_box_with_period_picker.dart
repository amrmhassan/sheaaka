// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/trader_app/constants/colors.dart';

class CheckBoxWithPeriodPicker extends StatelessWidget {
  final String title;
  const CheckBoxWithPeriodPicker({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCartCheckBox(),
        HSpace(factor: .5),
        Text(
          title,
          style: h3LiteTextStyle.copyWith(
            color: kTraderBlackColor,
          ),
        ),
        Spacer(),
        Text(
          'مدة الانتهاء',
          style: h3TextStyle.copyWith(
            color: kTraderPrimaryColor,
          ),
        )
      ],
    );
  }
}
