// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/products_search_provider.dart';
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
  void startSearch(String value) {
    if (value.isNotEmpty) {
      Provider.of<ProductsSearchProvider>(
        context,
        listen: false,
      ).applySearch(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBox(
            startSearch: startSearch,
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
                    onTap: () => startSearch(searchQuery),
                    searchQuery: searchQuery,
                  ),
                ),
                SearchFiltersButton(),
              ],
            ),
          ),
          VSpace(),
          SearchingResults(),
        ],
      ),
    );
  }
}
