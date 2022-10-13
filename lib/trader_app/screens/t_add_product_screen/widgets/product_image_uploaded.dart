// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/trader_app/constants/colors.dart';

class ProductImageUploaded extends StatelessWidget {
  const ProductImageUploaded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kVPad),
      width: 180,
      height: 280,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kTraderSecondaryColor.withOpacity(.3),
        ),
      ),
      child: Image.asset(
        'assets/images/3.jpg',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
