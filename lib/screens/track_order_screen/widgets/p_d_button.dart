// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/product_screen/product_screen.dart';

// product description button
class OpenProductDescriptionFromTrackerButton extends StatelessWidget {
  final String productId;
  const OpenProductDescriptionFromTrackerButton({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kVPad / 2,
      ),
      child: ButtonWrapper(
        onTap: () {
          Navigator.pushNamed(context, ProductScreen.routeName,
              arguments: productId);
        },
        backgroundColor: kPrimaryColor,
        child: Text(
          'صفحة المنتج',
          style: h2liteTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
