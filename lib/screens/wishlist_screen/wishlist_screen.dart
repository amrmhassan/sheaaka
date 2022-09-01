// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/wishlist_screen/widgets/horizontal_post.dart';
import 'package:project/screens/wishlist_screen/widgets/wishlist_names.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(),
          PaddingWrapper(
            child: Text(
              'قوائم التمني',
              style: h4LiteTextStyle,
            ),
          ),
          VSpace(factor: .5),
          WishListsNames(),
          VSpace(),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HorizontalPost(),
                  HorizontalPost(),
                  HorizontalPost(),
                  HorizontalPost(),
                  HorizontalPost(),
                  HorizontalPost(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
