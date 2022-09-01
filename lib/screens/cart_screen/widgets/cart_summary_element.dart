// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';

class CartSummaryElement extends StatelessWidget {
  final String title;
  final double price;
  const CartSummaryElement({
    Key? key,
    this.title = 'السعر',
    this.price = 149.99,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: largePadding),
            height: 1,
            color: kSecondaryColor.withOpacity(.2),
          ),
        ),
        ProductCartPrice(
          price: price,
        ),
      ],
    );
  }
}
