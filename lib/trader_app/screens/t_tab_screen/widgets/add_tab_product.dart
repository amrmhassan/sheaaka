// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_choose_product_screen/t_choose_product_screen.dart';

class AddTabProduct extends StatelessWidget {
  final StoreTabModel currentActiveStoreTab;
  const AddTabProduct({
    super.key,
    required this.currentActiveStoreTab,
  });

  void handleAddProductsToTab(List<ProductModel> products) {
    print(products.length);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () async {
        List<ProductModel>? selectedProducts = await Navigator.pushNamed(
          context,
          TChooseProductScreen.routeName,
          arguments: currentActiveStoreTab,
        ) as List<ProductModel>?;
        if (selectedProducts != null && selectedProducts.isEmpty) {
          handleAddProductsToTab(selectedProducts);
        }
      },
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
