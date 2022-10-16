// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/trader_app/constants/colors.dart';

class TabCard extends StatelessWidget {
  const TabCard({
    Key? key,
    required this.storeTabModel,
  }) : super(key: key);

  final StoreTabModel storeTabModel;

  @override
  Widget build(BuildContext context) {
    bool allProducts = storeTabModel.allProducts;
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: kTraderSecondaryColor.withOpacity(.05),
      margin: EdgeInsets.only(bottom: kVPad / 2),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kVPad / 1.3,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/sections.png',
            width: mediumIconSize,
            color: kTraderPrimaryColor,
          ),
          HSpace(factor: .5),
          Text(
            storeTabModel.title,
            style: h3TextStyle.copyWith(
              color: kTraderBlackColor,
            ),
          ),
          Spacer(),
          if (!allProducts)
            Text(
              '${storeTabModel.productsIds.length} منتج',
              style: h3InactiveTextStyle.copyWith(
                color: kTraderSecondaryColor.withOpacity(1),
              ),
            ),
        ],
      ),
    );
  }
}
