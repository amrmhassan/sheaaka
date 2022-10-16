// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_choose_product_screen/widgets/choose_product_app_bar.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:provider/provider.dart';

class TChooseProductScreen extends StatefulWidget {
  static const String routeName = 't-choose-product-screen';
  const TChooseProductScreen({super.key});

  @override
  State<TChooseProductScreen> createState() => _TChooseProductScreenState();
}

class _TChooseProductScreenState extends State<TChooseProductScreen> {
  //? selected products
  List<ProductModel> selectedProducts = [];
  void toggleSelectProduct(ProductModel p) {
    if (selectedProducts.contains(p)) {
      setState(() {
        selectedProducts.remove(p);
      });
    } else {
      setState(() {
        selectedProducts.add(p);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    StoreTabModel currentActiveTab =
        ModalRoute.of(context)!.settings.arguments as StoreTabModel;
    var traderProvider = Provider.of<TraderProvider>(context);
    var productsProvider = Provider.of<ProductsProvider>(context);
    StoreModel myStore = traderProvider.myStore!;
    var nonSelectedProducts = productsProvider
        .getStoreProducts(myStore.id)
        .where((product) => !currentActiveTab.productsIds.contains(product.id))
        .toList();

    return ScreensWrapper(
      child: Column(
        children: [
          ChooseProductAppBar(
            selectedProducts: selectedProducts,
            uploadActive: selectedProducts.isNotEmpty,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nonSelectedProducts.length,
              itemBuilder: ((context, index) {
                var productModel = nonSelectedProducts[index];
                return TraderProductCard(
                  productModel: productModel,
                  enableSelection: true,
                  onSelectionChanged: () {
                    toggleSelectProduct(productModel);
                  },
                  selected: selectedProducts.contains(productModel),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
