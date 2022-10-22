// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/profile_image/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/profile_screen/widgets/profile_summary_element.dart';
import 'package:provider/provider.dart';

double profileImageRadius = 80;

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var ordersProvider = Provider.of<OrdersProvider>(context);
    var wishlistProvider = Provider.of<WishListsProvider>(context);
    return Row(
      children: [
        ProfileImage(
          allowClick: false,
          radius: profileImageRadius,
          userRole: UserRole.normal,
          padding: EdgeInsets.all(smallPadding / 3),
        ),
        HSpace(),
        ProfileSummaryElement(
          amount: cartProvider.cartItems.length,
          title: 'عربة التسوق',
        ),
        ProfileSummaryElement(
          amount: ordersProvider.orders.length,
          title: "طلبيات",
        ),
        ProfileSummaryElement(
          amount: wishlistProvider.wishlistItems.length,
          title: "قائمة التمني",
        ),
      ],
    );
  }
}
