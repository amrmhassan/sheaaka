// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/modals/add_wishlist_modal.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:provider/provider.dart';

class AddWishListButton extends StatefulWidget {
  const AddWishListButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWishListButton> createState() => _AddWishListButtonState();
}

class _AddWishListButtonState extends State<AddWishListButton> {
  String wishListName = '';
  void setWishListName(String n) {
    setState(() {
      wishListName = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (ctx) => ModalWrapper(
            applyButtonTitle: 'إضافة',
            child: AddWishlistModal(
              setWishListName: setWishListName,
            ),
            onApply: () async {
              if (wishListName.isNotEmpty) {
                await Provider.of<WishListsProvider>(context, listen: false)
                    .addWishList(wishListName);
              }
              // Navigator.pop(ctx);
            },
          ),
        );
      },
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: kSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Image.asset(
        'assets/icons/plus.png',
        color: kSecondaryColor,
        width: mediumIconSize,
      ),
    );
  }
}
