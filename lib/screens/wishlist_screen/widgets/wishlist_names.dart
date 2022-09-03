// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_name.dart';

class WishListsNames extends StatelessWidget {
  final bool allowIndent;
  const WishListsNames({
    Key? key,
    this.allowIndent = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (allowIndent) HSpace(),
          AddWishListButton(),
          HSpace(factor: .5),
          WishListName(
            title: 'الكل',
          ),
          WishListName(
            title: 'فرح أخويا',
            active: true,
          ),
          WishListName(
            title: 'شنط العيال',
          ),
          WishListName(
            title: 'تحويش البدلة',
          ),
        ],
      ),
    );
  }
}
