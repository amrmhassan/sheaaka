// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/dot.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/screens/cart_screen/widgets/cart_products_separator.dart';
import 'package:project/screens/cart_screen/widgets/delete_product_from_cart_button.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_color.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_image.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_name.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_size.dart';
import 'package:project/screens/track_order_screen/track_order_screen.dart';

class OrderProductElement extends StatelessWidget {
  final CartItemModel cartItemModel;
  final String storeName;

  const OrderProductElement({
    Key? key,
    required this.cartItemModel,
    required this.storeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // textDirection: TextDirection.rtl,
          children: [
            ProductCartImage(
              imagePath: cartItemModel.productImage,
              onTap: () {
                Navigator.pushNamed(context, TrackOrderScreen.routeName,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProductCartName(
                        name: cartItemModel.productName,
                      ),
                      Spacer(),
                      Text(
                        cartItemModel.productName,
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
                        price: cartItemModel.productPrice,
                      ),
                      if (cartItemModel.size != null)
                        Row(
                          children: [
                            HSpace(factor: 0.5),
                            Dot(),
                            HSpace(factor: 0.5),
                            ProductCartSize(
                              size: cartItemModel.size!,
                            ),
                          ],
                        ),
                      if (cartItemModel.color != null)
                        Row(
                          children: [
                            HSpace(factor: 0.5),
                            Dot(),
                            HSpace(factor: 0.5),
                            ProductCartColor(
                              color: cartItemModel.color!,
                            ),
                          ],
                        ),
                    ],
                  ),
                  VSpace(),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: h3InactiveTextStyle,
                          children: [
                            TextSpan(text: 'عدد'),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: cartItemModel.quantity.toString(),
                              style: h3InactiveTextStyle.copyWith(
                                color: kLoveColor,
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(text: 'منتجات'),
                          ],
                        ),
                      ),
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
        const CartProductsSeparator(),
      ],
    );
  }
}
