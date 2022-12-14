// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';

class AddWishlistModal extends StatelessWidget {
  final Function(String n) setWishListName;
  const AddWishlistModal({
    Key? key,
    required this.setWishListName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'إضافة قائمة تمني جديدة',
          style: h4TextStyle,
        ),
        VSpace(),
        CustomTextField(
          autoFocus: true,
          onChange: setWishListName,
          padding: EdgeInsets.zero,
          iconName: 'pen',
          title: 'اسم القائمة',
          color: kSecondaryColor,
          borderColor: kSecondaryColor,
        )
      ],
    );
  }
}
