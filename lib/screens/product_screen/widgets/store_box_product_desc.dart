// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/store_screen/store_screen.dart';

class StoreBoxProductDesc extends StatelessWidget {
  const StoreBoxProductDesc({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, StoreScreen.routeName,
              arguments: productModel.storeId);
        },
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad / 2),
          decoration: BoxDecoration(
            color: kLightColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(largeBorderRadius),
            ),
          ),
          child: Text(
            productModel.storeName,
            style: h3TextStyle,
          ),
        ),
      ),
    );
  }
}
