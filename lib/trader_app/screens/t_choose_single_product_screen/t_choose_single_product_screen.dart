// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/store_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:provider/provider.dart';

class TChooseSingleProductsScreen extends StatefulWidget {
  static const String routeName = 't-choose-single-product-screen';
  const TChooseSingleProductsScreen({super.key});

  @override
  State<TChooseSingleProductsScreen> createState() =>
      _TChooseMultipleProductsScreenState();
}

class _TChooseMultipleProductsScreenState
    extends State<TChooseSingleProductsScreen> {
  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    var productsProvider = Provider.of<ProductsProvider>(context);
    StoreModel myStore = traderProvider.myStore!;
    var nonSelectedProducts =
        productsProvider.getStoreProducts(myStore.id).toList();

    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'اختر منتج',
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: nonSelectedProducts.length,
              itemBuilder: ((context, index) {
                var productModel = nonSelectedProducts[index];
                return TraderProductCard(
                  onTap: () {
                    Navigator.pop(context, productModel);
                  },
                  productModel: productModel,
                  onSelectionChanged: () {},
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
