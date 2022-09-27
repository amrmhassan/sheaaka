// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/screens/orders_screen/widgets/order_product_element.dart';

class OrderProductWrapper extends StatelessWidget {
  final String storeName;
  final CartItemModel cartItemModel;

  const OrderProductWrapper({
    Key? key,
    required this.storeName,
    required this.cartItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderProductElement(
      storeName: storeName,
      cartItemModel: cartItemModel,
    );
  }
}
