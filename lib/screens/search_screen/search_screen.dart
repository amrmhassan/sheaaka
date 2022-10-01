// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/products_search_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/search_screen/widgets/search_box.dart';
import 'package:project/screens/search_screen/widgets/search_filters_button.dart';
import 'package:project/screens/search_screen/widgets/searching_results.dart';
import 'package:project/screens/search_screen/widgets/start_search_button.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  void startSearch(String value, SearchTypes searchType) {
    if (value.isNotEmpty) {
      if (searchType == SearchTypes.product) {
        var productProvider =
            Provider.of<ProductsProvider>(context, listen: false);

        Provider.of<SearchProvider>(
          context,
          listen: false,
        ).applySearchProducts(value, productProvider);
      } else if (searchType == SearchTypes.store) {
        var storeProvider = Provider.of<StoreProvider>(context, listen: false);
        Provider.of<SearchProvider>(
          context,
          listen: false,
        ).applySearchStores(value, storeProvider);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchTypes searchType =
        ModalRoute.of(context)!.settings.arguments! as SearchTypes;
    return ScreensWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBox(
            startSearch: () => startSearch(searchQuery, searchType),
            updateSearchQuery: (value) {
              setState(() {
                searchQuery = value;
              });
            },
          ),
          VSpace(factor: .5),
          PaddingWrapper(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: StartSearchButton(
                    onTap: () => startSearch(searchQuery, searchType),
                    searchQuery: searchQuery,
                  ),
                ),
                SearchFiltersButton(),
              ],
            ),
          ),
          VSpace(),
          SearchingResults(
            searchType: searchType,
          ),
        ],
      ),
    );
  }
}
