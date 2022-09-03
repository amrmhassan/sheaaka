// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';

class AddToWishlistModal extends StatelessWidget {
  const AddToWishlistModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      onApply: () {},
      applyButtonTitle: 'إضافة',
      child: Column(
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
      ),
    );
  }
}
