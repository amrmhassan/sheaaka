//? the actual cart product card
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/dot.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/screens/cart_screen/widgets/delete_product_from_cart_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_color.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_image.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_name.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_quantity_controller_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_size.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatelessWidget {
  final bool selected;
  final CartItemModel cartItemModel;

  const CartProduct({
    Key? key,
    this.selected = true,
    required this.cartItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // textDirection: TextDirection.rtl,
      children: [
        ProductCartImage(
          imagePath: cartItemModel.productImage,
          onTap: () {
            Navigator.pushNamed(context, ProductScreen.routeName,
                arguments: cartItemModel.productId);
          },
        ),
        HSpace(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCartName(
                    name: cartItemModel.productName,
                  ),
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
                  ProductCartSize(
                    size: cartItemModel.size,
                  ),
                  HSpace(factor: 0.5),
                  Dot(),
                  HSpace(factor: 0.5),
                  ProductCartColor(
                    color: cartItemModel.color,
                  ),
                ],
              ),
              VSpace(),
              Row(
                children: [
                  ProductCartQuantityControllerButton(
                    onTap: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .cartItemIncreaseQuantity(cartItemModel.id);
                    },
                    iconPath: 'assets/icons/plus.png',
                  ),
                  HSpace(),
                  ProductCartQuantity(
                    quantity: cartItemModel.quantity,
                  ),
                  HSpace(),
                  ProductCartQuantityControllerButton(
                    onTap: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .cartItemDecreaseQuantity(cartItemModel.id);
                    },
                    iconPath: 'assets/icons/minus1.png',
                  ),
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
