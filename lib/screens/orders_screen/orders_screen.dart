// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/order_model.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/screens/orders_screen/widgets/order.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders-screen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var orderProvider = Provider.of<OrdersProvider>(context);
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'الطلبيات',
            rightIcon: AppBarIcon(
              onTap: () {},
              iconName: 'settings',
              backgroundColor: Colors.transparent,
            ),
          ),
          VSpace(),
          // CategoryCustomerTypeContainer(),
          // VSpace(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: orderProvider.orders.map((e) {
                  OrderModel firstOrderItem = orderProvider.orders.first;
                  bool open = e.id == firstOrderItem.id;
                  return Order(
                    order: e,
                    open: open,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
