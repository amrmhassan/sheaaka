import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/cart_screen/widgets/cart_summary_element.dart';
import 'package:project/screens/cart_screen/widgets/checkout_button.dart';
import 'package:project/screens/cart_screen/widgets/coupon_area.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: kVPad, horizontal: kHPad * 2),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [defaultBoxShadow],
      ),
      child: Column(
        children: const [
          CouponArea(),
          VSpace(factor: .5),
          CartSummaryElement(title: 'السعر', price: 149.9),
          CartSummaryElement(title: 'الشحن', price: 20),
          CartSummaryElement(title: 'الإجمالي', price: 500),
          Spacer(),
          CheckOutButton()
        ],
      ),
    );
  }
}
