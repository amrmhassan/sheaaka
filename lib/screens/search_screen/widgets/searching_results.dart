// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/constants/types.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/models/store_model.dart';
import 'package:project/providers/products_search_provider.dart';
import 'package:project/screens/store_screen/store_screen.dart';
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
    var searchProvider = Provider.of<ProductsSearchProvider>(context);
    return Expanded(
      child: searchProvider.products.isNotEmpty &&
                  searchType == SearchTypes.product ||
              searchProvider.stores.isNotEmpty &&
                  searchType == SearchTypes.store
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: searchType == SearchTypes.product
                  ? Column(
                      children: searchProvider.products
                          .map((e) => HorizontalPost(product: e))
                          .toList(),
                    )
                  : Column(
                      children: searchProvider.stores
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

class SearchResultStore extends StatelessWidget {
  final StoreModel storeModel;

  const SearchResultStore({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, StoreScreen.routeName,
            arguments: storeModel.id);
      },
      margin: EdgeInsets.only(bottom: kVPad / 2),
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
            ),
            child: Image.asset(
              storeModel.logoImagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          HSpace(),
          Text(storeModel.name),
          Spacer(),
          Rating(rating: storeModel.rating),
        ],
      ),
    );
  }
}
