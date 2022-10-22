// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/cart_screen/widgets/apply_coupon_button.dart';

class CouponArea extends StatelessWidget {
  const CouponArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(mediumBorderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(largePadding),
                  child: Image.asset(
                    'assets/icons/coupons.png',
                    color: kBlackColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    maxLength: 15,
                    decoration: InputDecoration(
                      // to hide the counter text of the textfield length
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'كود خصم',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: kInActiveTextColor),
                    ),
                  ),
                )
              ],
            ),
          ),
          ApplyCouponButton(),
        ],
      ),
    );
  }
}
