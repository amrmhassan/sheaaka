// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class AddProductPhotoButton extends StatelessWidget {
  const AddProductPhotoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      margin: EdgeInsets.only(left: kVPad),
      width: 150,
      height: 280,
      decoration: BoxDecoration(
        color: kTraderSecondaryColor.withOpacity(.1),
        border: Border.all(
          width: 1,
          color: kTraderSecondaryColor.withOpacity(.4),
        ),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(ultraLargePadding),
          width: largeIconSize * 2,
          height: largeIconSize * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            color: kTraderPrimaryColor,
          ),
          child: Image.asset(
            'assets/icons/plus.png',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
