// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/wishlist_screen/widgets/add_wishlist_button.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

class AddToWishlistModal extends StatelessWidget {
  final VoidCallback onApply;
  const AddToWishlistModal({
    Key? key,
    required this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishListsProvider>(context);
    return ModalWrapper(
      showApplyModalButton: wishlistProvider.wishLists.isNotEmpty,
      onApply: onApply,
      applyButtonTitle: 'إضافة',
      child: wishlistProvider.wishLists.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إضافة إلي قائمة التمني',
                  style: h3TextStyle,
                ),
                VSpace(),
                WishListsNames(allowIndent: false),
                VSpace(),
                CustomFormInput(
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
