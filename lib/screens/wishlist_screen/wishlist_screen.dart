// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:project/screens/wishlist_screen/widgets/no_wishlists.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

//! it is lagging ,so fix this
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<ProductModel> wishlistProducts = [];

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    var wishListProvider = Provider.of<WishListsProvider>(context);

    if (wishListProvider.wishLists.isNotEmpty &&
        wishListProvider.activeWishListId == null) {
      Provider.of<WishListsProvider>(
        context,
        listen: false,
      ).setActiveWishList(wishListProvider.wishLists.first.id);
    }
    if (wishListProvider.wishLists.isEmpty) {
    } else {
      setState(() {
        wishlistProducts = wishListProvider
            .getWishlistProducts(
                wishListProvider.activeWishListId!, productsProvider)
            .reversed
            .toList();
      });
    }
    return wishListProvider.wishLists.isEmpty
        ? NoWishlists()
        : Container(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSpace(factor: 2),
                WishListsNames(),
                VSpace(),
                Expanded(
                  child: wishlistProducts.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'لا يوجد منتجات هنا',
                                style: h4TextStyleInactive,
                              ),
                              Image.asset(
                                'assets/icons/book-mark.png',
                                width: largeIconSize,
                                color: kSecondaryColor,
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: wishlistProducts.length,
                          itemBuilder: (context, index) => HorizontalPost(
                              product: wishlistProducts.toList()[index]),
                        ),
                ),
              ],
            ),
          );
  }
}
