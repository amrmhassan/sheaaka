// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/filters_icon.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/n_of_notifications.dart';
import 'package:project/global/widgets/profile_image/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:provider/provider.dart';

class HomeAppBarLeftContent extends StatelessWidget {
  final List<Widget>? leftContent;
  final UserRole userRole;
  const HomeAppBarLeftContent(
      {Key? key, this.leftContent, required this.userRole})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var ordersProvider = Provider.of<OrdersProvider>(context);
    User? user = FirebaseAuth.instance.currentUser;
    int nOfNotifications =
        (cartProvider.cartItems.length + ordersProvider.orders.length);
    return Row(
      children: [
        if (leftContent != null) ...leftContent! else FiltersIcon(),
        HSpace(
          factor: .5,
        ),
        Stack(
          alignment: Alignment.topRight,
          clipBehavior: Clip.none,
          children: [
            //! this gesture detector was only for testing just remove it
            ProfileImage(
              userRole: userRole,
            ),
            if (nOfNotifications > 0 && user != null)
              NOfNotifications(
                nOfNotifications: nOfNotifications,
              ),
          ],
        ),
      ],
    );
  }
}
