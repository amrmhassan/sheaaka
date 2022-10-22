// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/wishlist_item_model.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

class AddToWishlistModal extends StatefulWidget {
  final VoidCallback onApply;
  final String? editedWishlistItemId;

  const AddToWishlistModal({
    Key? key,
    required this.onApply,
    this.editedWishlistItemId,
  }) : super(key: key);

  @override
  State<AddToWishlistModal> createState() => _AddToWishlistModalState();
}

class _AddToWishlistModalState extends State<AddToWishlistModal> {
  WishListItemModel? wishListItemModel;
  @override
  void initState() {
    if (widget.editedWishlistItemId != null) {
      WishListItemModel w =
          Provider.of<WishListsProvider>(context, listen: false)
              .getItemById(widget.editedWishlistItemId!);

      wishListItemModel = w;
    }
    super.initState();
  }

  String getModeString() {
    if (wishListItemModel == null) {
      return 'إضافة إلي قائمة التمني';
    } else {
      return 'تعديل ';
    }
  }

  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishListsProvider>(context);
    return ModalWrapper(
      showApplyModalButton: wishlistProvider.wishLists.isNotEmpty,
      onApply: widget.onApply,
      applyButtonTitle: 'إضافة',
      child: wishlistProvider.wishLists.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getModeString(),
                  style: h3TextStyle,
                ),
                VSpace(),
                WishListsNames(allowIndent: false),
                VSpace(),
                CustomTextField(
                  iconName: 'notes',
                  title: ' إضافة ملاحظة (اختياري)',
                  padding: EdgeInsets.zero,
                )
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'قم بإضافة قائمة تمني أولا',
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
            ),
    );
  }
}
