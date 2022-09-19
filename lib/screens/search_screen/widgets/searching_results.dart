// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/providers/products_search_provider.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:provider/provider.dart';

class SearchingResults extends StatelessWidget {
  const SearchingResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<ProductsSearchProvider>(context);
    return Expanded(
      child: searchProvider.products.isNotEmpty
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: searchProvider.products
                    .map((e) => HorizontalPost(product: e))
                    .toList(),
              ),
            )
          : Container(
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'لا يوجد نتائج',
                style: h3InactiveTextStyle,
              ),
            ),
    );
  }
}
