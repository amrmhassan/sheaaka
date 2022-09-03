// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/login_screen/widgets/custom_form_input.dart';

class AddWishlistModal extends StatelessWidget {
  const AddWishlistModal({
    Key? key,
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
        CustomFormInput(
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
