// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
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
              Provider.of<ProductsProvider>(context, listen: false)
                  .toggleWishListProduct(id);
            },
            color: kPrimaryColor,
          )
        : CustomIconButton(
            iconName: 'book-mark',
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
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
                  },
                ),
              );
            });

Widget handleShowBookMarkButtonAppBarIcon(
  BuildContext context,
  String id,
  bool? bookMarked,
) =>
    boolifyNull(bookMarked)
        ? AppBarIcon(
            iconName: 'bookmark',
            onTap: () {
              Provider.of<ProductsProvider>(context, listen: false)
                  .toggleWishListProduct(id);
            },
            color: kPrimaryColor,
          )
        : AppBarIcon(
            iconName: 'book-mark',
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
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
