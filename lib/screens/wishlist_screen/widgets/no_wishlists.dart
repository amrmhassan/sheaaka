// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';

class NoWishlists extends StatelessWidget {
  const NoWishlists({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'قم بإضافة قائمة تمني',
            style: h3InactiveTextStyle,
          ),
          VSpace(factor: .5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AddWishListButton(),
            ],
          ),
        ],
      ),
    );
  }
}
