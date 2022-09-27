// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/order_model.dart';
import 'package:project/screens/cart_screen/widgets/cart_items_count.dart';
import 'package:project/screens/orders_screen/widgets/order_product_wrapper.dart';
import 'package:project/screens/orders_screen/widgets/order_title.dart';
import 'package:project/utils/general_utils.dart';

class Order extends StatefulWidget {
  final bool open;
  final OrderModel order;
  const Order({
    Key? key,
    this.open = false,
    required this.order,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool innerOpen = false;
  void toggleInnerOpen() {
    setState(() {
      innerOpen = !innerOpen;
    });
  }

  @override
  void initState() {
    setState(() {
      innerOpen = widget.open;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderTitle(
          date: dateToString(widget.order.createdAt),
          price: widget.order.fullPrice,
          open: innerOpen,
          onTap: toggleInnerOpen,
        ),
        innerOpen
            ? Column(
                children: [
                  VSpace(),
                  CartItemsCount(
                    leading: 'يوجد',
                    count: widget.order.cartItems.length.toString(),
                  ),
                  ...widget.order.cartItems
                      .map(((e) => OrderProductWrapper(
                            cartItemModel: e,
                            storeName: 'Store Name',
                          )))
                      .toList(),
                ],
              )
            : SizedBox(),
        VSpace(),
      ],
    );
  }
}
