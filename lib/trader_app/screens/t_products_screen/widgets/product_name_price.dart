// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/trader_app/constants/colors.dart';

class ProductNamePrice extends StatelessWidget {
  const ProductNamePrice({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String name;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: h3TextStyle.copyWith(
            color: kTraderBlackColor,
          ),
        ),
        Spacer(),
        ProductCartPrice(
          price: price,
          traderStyle: true,
        )
      ],
    );
  }
}
