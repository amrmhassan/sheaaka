// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/dot.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/cart_screen/widgets/cart_products_separator.dart';
import 'package:project/screens/cart_screen/widgets/delete_product_from_cart_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_color.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_image.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_name.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity_controller_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_size.dart';
import 'package:project/screens/track_order_screen/track_order_screen.dart';

class OrderProductElement extends StatelessWidget {
  const OrderProductElement({
    Key? key,
    required this.storeName,
    required this.showAfterSeparator,
  }) : super(key: key);

  final String storeName;
  final bool showAfterSeparator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // textDirection: TextDirection.rtl,
          children: [
            ProductCartImage(
              imagePath: 'assets/images/1.jpg',
              onTap: () {
                Navigator.pushNamed(context, TrackOrderScreen.routeName);
              },
            ),
            HSpace(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProductCartName(
                        name: 'testing name',
                      ),
                      Spacer(),
                      Text(
                        storeName,
                        style: h5InactiveTextStyle,
                      ),
                    ],
                  ),
                  VSpace(factor: 0.5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // textDirection: TextDirection.rtl,
                    children: [
                      ProductCartPrice(
                        price: 50,
                      ),
                      HSpace(factor: 0.5),
                      Dot(),
                      HSpace(factor: 0.5),
                      ProductCartSize(
                        size: Sizes.m,
                      ),
                      HSpace(factor: 0.5),
                      Dot(),
                      HSpace(factor: 0.5),
                      ProductCartColor(
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  VSpace(),
                  Row(
                    children: [
                      ProductCartQuantityControllerButton(
                        onTap: () {},
                        iconPath: 'assets/icons/plus.png',
                      ),
                      HSpace(),
                      ProductCartQuantity(quantity: 1),
                      HSpace(),
                      ProductCartQuantityControllerButton(
                          onTap: () {}, iconPath: 'assets/icons/minus1.png'),
                      Spacer(),
                      DeleteProductFromCartButton(
                        cartItemId: 'kj',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            HSpace(),
          ],
        ),
        if (showAfterSeparator) const CartProductsSeparator(),
      ],
    );
  }
}
