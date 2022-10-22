//? showing the total item count in the cart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';

class CartItemsCount extends StatelessWidget {
  final String? leading;
  final String? count;
  const CartItemsCount({
    Key? key,
    this.leading,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kHPad),
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          style: h4TextStyleInactive,
          children: [
            TextSpan(text: leading ?? 'لديك'),
            TextSpan(text: ' '),
            TextSpan(
              text: count ?? '5',
              style: h4TextStyleInactive.copyWith(color: kRedTextColor),
            ),
            TextSpan(text: ' '),
            TextSpan(text: 'منتجات'),
          ],
        ),
      ),
    );
  }
}
