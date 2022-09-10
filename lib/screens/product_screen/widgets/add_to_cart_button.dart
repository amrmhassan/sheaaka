// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class AddToCartButton extends StatelessWidget {
  final bool active;
  const AddToCartButton({
    Key? key,
    this.active = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonWrapper(
        active: active,
        onTap: () {},
        backgroundColor: kPrimaryColor,
        padding: EdgeInsets.symmetric(vertical: kVPad / 2),
        child: Text(
          'إضافة للسلة',
          style: h3TextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
