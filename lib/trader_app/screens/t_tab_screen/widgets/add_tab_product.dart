// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class AddTabProduct extends StatelessWidget {
  const AddTabProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: kTraderSecondaryColor.withOpacity(.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(largePadding),
            width: largeIconSize * 1.5,
            height: largeIconSize * 1.5,
            decoration: BoxDecoration(
              color: kTraderPrimaryColor,
              borderRadius: BorderRadius.circular(500),
            ),
            child: Image.asset(
              'assets/icons/plus.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
