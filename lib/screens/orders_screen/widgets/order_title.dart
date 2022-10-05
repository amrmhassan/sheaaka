// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class OrderTitle extends StatelessWidget {
  final bool open;
  final String date;
  final double price;

  final VoidCallback onTap;
  const OrderTitle({
    Key? key,
    required this.open,
    required this.date,
    required this.price,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: ButtonWrapper(
        onTap: onTap,
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 3,
          vertical: kHPad / 4,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kSecondaryColor.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(smallBorderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date,
              style: h4TextStyleInactive.copyWith(height: 1),
            ),
            HSpace(factor: .4),
            Expanded(
              child: HLine(
                color: kSecondaryColor.withOpacity(.2),
                thickness: 1,
              ),
            ),
            HSpace(factor: .4),
            ProductCartPrice(
              fontSize: 14,
              price: price,
            ),
            HSpace(factor: .5),
            Image.asset(
              open
                  ? 'assets/icons/down-arrow.png'
                  : 'assets/icons/left-arrow.png',
              width: smallIconSize,
            ),
          ],
        ),
      ),
    );
  }
}
