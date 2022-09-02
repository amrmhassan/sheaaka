// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';
import 'package:project/screens/nearby_stores_screen/widgets/store_full_post.dart';

class NearbyStoresScreen extends StatelessWidget {
  const NearbyStoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          VSpace(factor: 2),
          OpenSearchBox(),
          VSpace(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  StoreFullPost(),
                  StoreFullPost(),
                  StoreFullPost(),
                  StoreFullPost(),
                  StoreFullPost(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
