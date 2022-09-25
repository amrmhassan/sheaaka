// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

//! it is lagging ,so fix this
class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool noWishList = false;
  List<ProductModel> wishlistProducts = [];
  List<ProductModel> activeWishListProducts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    var wishListProvider = Provider.of<WishListsProvider>(context);

    if (wishListProvider.activeWishListId == null) {
      setState(() {
        noWishList = true;
      });
    } else {
      setState(() {
        noWishList = true;
        wishlistProducts = productsProvider
            .getWhishListProducts(wishListProvider.activeWishListId!);
        activeWishListProducts = wishlistProducts
            .where(((element) =>
                element.wishListId == wishListProvider.activeWishListId))
            .toList();
      });
    }
    return noWishList
        ? Container(
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
          )
        : Container(
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
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: activeWishListProducts.length,
                          itemBuilder: (context, index) => HorizontalPost(
                              product: activeWishListProducts.toList()[index]),
                        ),
                ),
              ],
            ),
          );
  }
}
