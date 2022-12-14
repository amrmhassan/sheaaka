// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_name.dart';
import 'package:provider/provider.dart';

class WishListsNames extends StatelessWidget {
  final bool allowIndent;
  const WishListsNames({
    Key? key,
    this.allowIndent = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wishListProvider = Provider.of<WishListsProvider>(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (allowIndent) HSpace(),
          AddWishListButton(),
          HSpace(factor: .5),
          ...List.generate(
            wishListProvider.wishLists.length,
            (index) {
              WishListModel wishList = wishListProvider.wishLists[index];
              return WishListName(
                title: wishList.name,
                active: wishListProvider.activeWishListId == wishList.id,
                id: wishList.id,
              );
            },
          )
        ],
      ),
    );
  }
}
