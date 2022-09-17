// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/language/lang_controller.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/screens/cart_screen/widgets/cart_items_count.dart';
import 'package:project/screens/cart_screen/widgets/cart_product_wrapper.dart';
import 'package:project/screens/cart_screen/widgets/cart_summary.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(title: LC.langWord('cartTitle')),
          VSpace(),
          cartProvider.cartItems.isNotEmpty
              ? Expanded(
                  child: Column(
                    children: [
                      //? number of total products in the cart
                      CartItemsCount(
                        count: cartProvider.cartItems.length.toString(),
                      ),
                      VSpace(factor: 0.5),
                      //? products list
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: cartProvider.cartItems.map(
                              (element) {
                                // bool first =
                                //     cartProvider.cartItems.first == element;
                                return CartProductWrapper(
                                  cartItemModel: element,
                                  // showAfterSeparator: first,
                                  cartItemId: element.id,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      if (cartProvider.getSelectedCartItems.isNotEmpty)
                        CartSummary(),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            'عربة التسوق فارغة',
                            style: h4TextStyleInactive,
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset('assets/icons/shopping-cart.png')
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
