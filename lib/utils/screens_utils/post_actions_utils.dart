// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/modals/add_to_wishlist_modal.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/utils/bools.dart';
import 'package:provider/provider.dart';

Widget handleShowBookMarkButton(
  BuildContext context,
  String productId,
  String? wishlistItemId,
) =>
    wishlistItemId != null
        ? CustomIconButton(
            iconName: 'bookmark',
            onTap: () {
              //* remove wishlist item
              Provider.of<WishListsProvider>(context, listen: false)
                  .removeWishlistItem(wishlistItemId);
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
                    String? activeWishListId = Provider.of<WishListsProvider>(
                      context,
                      listen: false,
                    ).activeWishListId;
                    if (activeWishListId != null) {
                      //* add wishlist item
                      Provider.of<WishListsProvider>(context, listen: false)
                          .addWishlistItem(productId, activeWishListId,
                              'Fix this note to be the note from the text field');
                    }
                  },
                ),
              );
            });

Widget handleShowBookMarkButtonAppBarIcon(
  BuildContext context,
  String productId,
  String? wishlistItemId,
) =>
    wishlistItemId != null
        ? AppBarIcon(
            iconName: 'bookmark',
            onTap: () {
              //* remove wishlist item
              Provider.of<WishListsProvider>(context, listen: false)
                  .removeWishlistItem(wishlistItemId);
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
                    String? activeWishListId = Provider.of<WishListsProvider>(
                      context,
                      listen: false,
                    ).activeWishListId;
                    if (activeWishListId != null) {
                      //* add wishlist item
                      Provider.of<WishListsProvider>(context, listen: false)
                          .addWishlistItem(productId, activeWishListId,
                              'Fix this note to be the note from the text field');
                    }

                    Navigator.pop(context);
                  },
                ),
              );
            });
