// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/dot.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/cart_screen/widgets/cart_products_separator.dart';
import 'package:project/screens/cart_screen/widgets/delete_product_from_cart_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_color.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_image.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_name.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity_controller_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_size.dart';

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
              onTap: () {},
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
                      ProductCartName(),
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
                      ProductCartPrice(),
                      HSpace(factor: 0.5),
                      Dot(),
                      HSpace(factor: 0.5),
                      ProductCartSize(),
                      HSpace(factor: 0.5),
                      Dot(),
                      HSpace(factor: 0.5),
                      ProductCartColor(),
                    ],
                  ),
                  VSpace(),
                  Row(
                    children: [
                      ProductCartQuantityControllerButton(
                        iconPath: 'assets/icons/plus.png',
                      ),
                      HSpace(),
                      ProductCartQuantity(),
                      HSpace(),
                      ProductCartQuantityControllerButton(
                          iconPath: 'assets/icons/minus1.png'),
                      Spacer(),
                      DeleteProductFromCartButton(),
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
