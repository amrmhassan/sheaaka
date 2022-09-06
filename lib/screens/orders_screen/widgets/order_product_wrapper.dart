// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/orders_screen/widgets/order_product_element.dart';

class OrderProductWrapper extends StatelessWidget {
  final bool showAfterSeparator;
  final String storeName;

  const OrderProductWrapper({
    Key? key,
    required this.storeName,
    this.showAfterSeparator = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderProductElement(
        storeName: storeName, showAfterSeparator: showAfterSeparator);
  }
}
