// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/screens/cart_screen/widgets/cart_summary_element.dart';
import 'package:project/screens/cart_screen/widgets/checkout_button.dart';
import 'package:project/screens/cart_screen/widgets/coupon_area.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  final VoidCallback onProceedCheckOut;

  const CartSummary({
    Key? key,
    required this.onProceedCheckOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartPrice = Provider.of<CartProvider>(context).getCartPrice();
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: kVPad, horizontal: kHPad * 2),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [defaultBoxShadow],
      ),
      child: Column(
        children: [
          CouponArea(),
          VSpace(factor: .5),
          CartSummaryElement(title: 'السعر', price: cartPrice),
          CartSummaryElement(title: 'الشحن', price: shippingPrice),
          CartSummaryElement(
              title: 'الإجمالي', price: cartPrice + shippingPrice),
          Spacer(),
          CheckOutButton(
            onTap: onProceedCheckOut,
          )
        ],
      ),
    );
  }
}
