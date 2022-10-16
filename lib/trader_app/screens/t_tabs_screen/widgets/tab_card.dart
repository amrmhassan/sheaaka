// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_products_screen/t_products_screen.dart';
import 'package:project/trader_app/screens/t_tab_screen/t_tab_screen.dart';
import 'package:provider/provider.dart';

class TabCard extends StatelessWidget {
  const TabCard({
    Key? key,
    required this.storeTabModel,
  }) : super(key: key);

  final StoreTabModel storeTabModel;

  @override
  Widget build(BuildContext context) {
    bool allProducts = storeTabModel.allProducts;
    int tabsNum = storeTabModel.productsIds.length;
    return ButtonWrapper(
      onTap: allProducts
          ? () {
              var traderProvider =
                  Provider.of<TraderProvider>(context, listen: false);
              var productsProvider =
                  Provider.of<ProductsProvider>(context, listen: false);
              var storeProducts =
                  productsProvider.getStoreProducts(traderProvider.myStore!.id);
              Navigator.pushNamed(context, TProductsScreen.routeName,
                  arguments: storeProducts);
            }
          : () {
              Navigator.pushNamed(
                context,
                TTabScreen.routeName,
                arguments: storeTabModel,
              );
            },
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
            storeTabModel.allProducts ? 'كل المنتجات' : storeTabModel.title,
            style: h3TextStyle.copyWith(
              color: kTraderBlackColor,
            ),
          ),
          Spacer(),
          if (!allProducts)
            Text(
              tabsNum == 0 ? 'قسم فارغ' : '$tabsNum منتج',
              style: h3InactiveTextStyle.copyWith(
                color: kTraderSecondaryColor.withOpacity(1),
              ),
            ),
        ],
      ),
    );
  }
}
