// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/modals/add_to_wishlist_modal.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/utils/bools.dart';
import 'package:provider/provider.dart';

Widget handleShowBookMarkButton(
  BuildContext context,
  String id,
  bool? bookMarked,
) =>
    boolifyNull(bookMarked)
        ? CustomIconButton(
            iconName: 'bookmark',
            onTap: () {
              String activeWishListId = Provider.of<WishListsProvider>(
                context,
                listen: false,
              ).activeWishListId;
              Provider.of<ProductsProvider>(context, listen: false)
                  .toggleWishListProduct(id, activeWishListId);
            },
            color: kPrimaryColor,
          )
        : CustomIconButton(
            iconName: 'book-mark',
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (ctx) => AddToWishlistModal(
                  onApply: () {
                    String activeWishListId = Provider.of<WishListsProvider>(
                      context,
                      listen: false,
                    ).activeWishListId;
                    Provider.of<ProductsProvider>(context, listen: false)
                        .toggleWishListProduct(id, activeWishListId);
                    Navigator.pop(context);
                  },
                ),
              );
            });
