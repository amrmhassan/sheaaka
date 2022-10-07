// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/modals/add_to_wishlist_modal.dart';
import 'package:project/models/types.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

//? show it in the full post
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

//? show book mark icon in the product desc screen
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
            onTap: () => handleAddWishlistItem(context, productId),
          );

//? toggle love button
Future<void> toggleLove(BuildContext context, String productId) async {
  try {
    await Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).toggleFavProduct(productId);
  } catch (e) {
    showSnackBar(
        context: context, message: 'حدث خطأ', snackBarType: SnackBarType.error);
  }
}

//? show love button
Widget handleShowLoveButton(
  BuildContext context,
  String productId,
) {
  bool loved = Provider.of<ProductsProvider>(context)
      .favoriteProductsIds
      .contains(productId);
  return loved
      ? CustomIconButton(
          iconName: 'heart2',
          onTap: () => toggleLove(context, productId),
          color: kLoveColor,
        )
      : CustomIconButton(
          iconName: 'heart',
          onTap: () => toggleLove(context, productId),
        );
}

//? handleShowNotLoggedInLoveButton
Widget handleShowNotLoggedInLoveButton(
  BuildContext context,
) {
  return CustomIconButton(
    iconName: 'heart',
    color: kSecondaryColor,
    onTap: () {
      showSnackBar(
          context: context,
          message: 'قم بتسجيل الدخول أولا',
          snackBarType: SnackBarType.info);
    },
  );
}

void handleAddWishlistItem(BuildContext context, String productId) {
  String? activeWishListId = Provider.of<WishListsProvider>(
    context,
    listen: false,
  ).activeWishListId;
  if (activeWishListId != null) {
    //* add wishlist item
    Provider.of<WishListsProvider>(context, listen: false).addWishlistItem(
        productId,
        activeWishListId,
        'Fix this note to be the note from the text field');
    WishListModel activewishlistModel =
        Provider.of<WishListsProvider>(context, listen: false)
            .activeWishlistModel()!;
    showSnackBar(
        context: context,
        message: 'تمت إضافته الي قائمة  "${activewishlistModel.name}"',
        snackBarType: SnackBarType.success);
  } else {
    //? show modal of adding new wishlist first
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => AddToWishlistModal(
        onApply: () async {
          String? activeWishListId = Provider.of<WishListsProvider>(
            context,
            listen: false,
          ).activeWishListId;
          if (activeWishListId != null) {
            //* add wishlist item
            await Provider.of<WishListsProvider>(context, listen: false)
                .addWishlistItem(productId, activeWishListId,
                    'Fix this note to be the note from the text field');
            WishListModel activewishlistModel =
                Provider.of<WishListsProvider>(context, listen: false)
                    .activeWishlistModel()!;
            showSnackBar(
                context: context,
                message: 'تمت إضافته الي قائمة  "${activewishlistModel.name}"',
                snackBarType: SnackBarType.success);
          } else {
            // showSnackBar(context:context, 'message', SnackBarType.error);
          }
        },
      ),
    );
  }
}
