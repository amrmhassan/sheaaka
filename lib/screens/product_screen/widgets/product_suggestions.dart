// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/product_screen/widgets/product_suggestion_card.dart';
import 'package:provider/provider.dart';

class ProductSuggestions extends StatelessWidget {
  const ProductSuggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductsProvider>(context);

    return productProvider.suggestionsProducts.isEmpty
        ? Container(
            padding: EdgeInsets.symmetric(vertical: kVPad / 2),
            child: Text(
              'لا يوجد اقتراحات',
              style: h3InactiveTextStyle,
            ),
          )
        : Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(
                  horizontal: kHPad,
                  vertical: kVPad / 2,
                ),
                child: Text(
                  'الاقتراحات',
                  style: h2TextStyle,
                ),
              ),
              GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productProvider.suggestionsProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: kHPad / 2,
                  mainAxisSpacing: kVPad / 2,
                ),
                itemBuilder: (context, index) {
                  ProductModel p = productProvider.suggestionsProducts[index];
                  return ProductSuggestionCard(
                    imagePath: p.imagesPath[0],
                    productId: p.id,
                    name: p.name,
                    price: p.price,
                  );
                },
              ),
            ],
          );
  }
}
