// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/search_screen/widgets/search_box.dart';
import 'package:project/screens/search_screen/widgets/search_filters_button.dart';
import 'package:project/screens/search_screen/widgets/searching_results.dart';
import 'package:project/screens/search_screen/widgets/start_search_button.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBox(),
          VSpace(factor: .5),
          PaddingWrapper(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StartSearchButton(),
                Spacer(),
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
