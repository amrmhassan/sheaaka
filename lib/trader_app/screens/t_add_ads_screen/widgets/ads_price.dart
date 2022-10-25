// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/trader_app/constants/colors.dart';

const double _ourRatio = .005;

class AdsPrice extends StatelessWidget {
  final double productPrice;
  final double? productDiscount;
  final DateTime endDate;

  const AdsPrice({
    Key? key,
    required this.productDiscount,
    required this.productPrice,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int endInHours = endDate.difference(DateTime.now()).inHours;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'سعر الاعلان',
              style: h4TextStyle.copyWith(
                color: kTraderBlackColor,
              ),
            ),
            ProductCartPrice(
              price: _ourRatio * endInHours * productPrice,
              color: kTraderBlackColor,
              fontSize: h4TextSize,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        HLine(
          color: kTraderSecondaryColor.withOpacity(.2),
        ),
      ],
    );
  }
}
