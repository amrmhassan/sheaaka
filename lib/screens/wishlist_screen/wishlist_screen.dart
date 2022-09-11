// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

//! filtering wish list products according to their name will be done here in the local state, not the provider state
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);

    var wishListProvider = Provider.of<WishListsProvider>(context);
    var wishlistProducts = productsProvider
        .getWhishListProducts(wishListProvider.activeWishListId);
    var activeWishListProducts = wishlistProducts.where(
        ((element) => element.wishListId == wishListProvider.activeWishListId));

    return Container(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(factor: 2),
          WishListsNames(),
          VSpace(),
          Expanded(
            child: activeWishListProducts.isEmpty
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
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: activeWishListProducts
                          .map((product) => HorizontalPost(product: product))
                          .toList(),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
