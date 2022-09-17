// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/orders_screen/widgets/order.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders-screen';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Order(
                    open: true,
                  ),
                  Order(),
                  Order(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
