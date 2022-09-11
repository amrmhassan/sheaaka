// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/fake_data/products.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(factor: 2),
          WishListsNames(),
          VSpace(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: productsProvider
                    .getWhishListProducts()
                    .map((product) => HorizontalPost(product: product))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
