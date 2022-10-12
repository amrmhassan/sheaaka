// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_product_screen/t_add_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/products_number.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/t_product_screen_app_bar.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';

class TProductsScreen extends StatelessWidget {
  static const String routeName = '/t-products-screen';

  const TProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var storeProducts =
        ModalRoute.of(context)!.settings.arguments as List<ProductModel>;

    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {
          Navigator.pushNamed(context, TAddProductScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(largePadding),
          child: Image.asset(
            'assets/icons/plus.png',
            color: Colors.white,
          ),
        ),
      ),
      child: Column(
        children: [
          TProductsScreenAppBar(),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          ProductsNumber(number: storeProducts.length),
          VSpace(factor: .5),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: storeProducts.length,
              itemBuilder: (context, index) {
                ProductModel productModel = storeProducts[index];
                return TraderProductCard(productModel: productModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
