// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/language/lang_controller.dart';
import 'package:project/screens/cart_screen/widgets/cart_items_count.dart';
import 'package:project/screens/cart_screen/widgets/cart_product_wrapper.dart';
import 'package:project/screens/cart_screen/widgets/cart_summary.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(title: LC.langWord('cartTitle')),
          VSpace(),
          //? number of total products in the cart
          CartItemsCount(),
          VSpace(factor: 0.5),
          //? products list
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CartProductWrapper(
                    selected: false,
                  ),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(),
                  CartProductWrapper(showAfterSeparator: false),
                  VSpace(),
                ],
              ),
            ),
          ),
          CartSummary(),
        ],
      ),
    );
  }
}
