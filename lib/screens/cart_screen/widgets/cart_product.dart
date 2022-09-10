//? the actual cart product card
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/dot.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/cart_screen/widgets/delete_product_from_cart_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_color.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_image.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_name.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity_controller_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_size.dart';

class CartProduct extends StatelessWidget {
  final bool selected;

  const CartProduct({
    Key? key,
    this.selected = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // textDirection: TextDirection.rtl,
      children: [
        ProductCartImage(),
        HSpace(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCartName(),
                  Spacer(),
                  ProductCartCheckBox(
                    checked: selected,
                  ),
                ],
              ),
              VSpace(factor: 0.5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // textDirection: TextDirection.rtl,
                children: [
                  ProductCartPrice(
                    price: 144,
                  ),
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
                      iconPath: 'assets/icons/plus.png'),
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
    );
  }
}
