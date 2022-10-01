// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/search_provider.dart';
import 'package:project/screens/search_screen/widgets/search_result_store.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:provider/provider.dart';

class SearchingResults extends StatelessWidget {
  final SearchTypes searchType;
  const SearchingResults({
    Key? key,
    required this.searchType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Expanded(
      child: searchProvider.searchProducts.isNotEmpty &&
                  searchType == SearchTypes.product ||
              searchProvider.searchStores.isNotEmpty &&
                  searchType == SearchTypes.store ||
              searchProvider.searchProducts.isNotEmpty &&
                  searchType == SearchTypes.storeProducts
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: searchType == SearchTypes.product
                  ? Column(
                      children: searchProvider.searchProducts
                          .map((e) => HorizontalPost(product: e))
                          .toList(),
                    )
                  : searchType == SearchTypes.storeProducts
                      ? Column(
                          children: searchProvider.storeProductsSearch
                              .map((e) => HorizontalPost(product: e))
                              .toList(),
                        )
                      : Column(
                          children: searchProvider.searchStores
                              .map(
                                (e) => SearchResultStore(
                                  storeModel: e,
                                ),
                              )
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
