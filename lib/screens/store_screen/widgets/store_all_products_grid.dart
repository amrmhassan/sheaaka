// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:provider/provider.dart';

class StoreAllProductsGrid extends StatelessWidget {
  final String storeId;
  const StoreAllProductsGrid({
    Key? key,
    required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! make the taps to float in the of the screen when reaching the top while scrolling

    var productsProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> storeProducts =
        productsProvider.getStoreProducts(storeId);
    return GridView.count(
      // padding: EdgeInsets.symmetric(vertical: kVPad),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(
        storeProducts.length,
        (index) => StoreProductCardSquare(
          imagePath: storeProducts[index].imagesPath[0],
          productId: storeProducts[index].id,
        ),
      ),
    );
  }
}

class StoreProductCardSquare extends StatelessWidget {
  final String productId;
  final String imagePath;
  const StoreProductCardSquare({
    Key? key,
    required this.productId,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: productId,
        );
      },
      child: Image.asset(
        imagePath,
        width: double.infinity,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
    );
  }
}
