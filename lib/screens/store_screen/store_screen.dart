// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/global/widgets/n_of_followers.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/screens/store_screen/widgets/follow_store.dart';
import 'package:project/screens/store_screen/widgets/mail_store.dart';
import 'package:project/screens/store_screen/widgets/store_all_products_grid.dart';
import 'package:project/screens/store_screen/widgets/store_name.dart';
import 'package:project/screens/store_screen/widgets/store_offers.dart';
import 'package:project/screens/store_screen/widgets/store_page_header.dart';
import 'package:project/screens/store_screen/widgets/store_products_type.dart';
import 'package:project/screens/store_screen/widgets/store_taps.dart';

const double storeLogoRadius = 100;
const double storeTitleHSpace = kHPad / 2;

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);
  static const String routeName = '/store-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StorePageHeader(),
          PaddingWrapper(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSpace(factor: .5),
                Row(
                  children: [
                    Spacer(),
                    NOfFollowers(num: 5),
                    HSpace(factor: .5),
                    Rating(),
                  ],
                ),
                VSpace(factor: .5),
                Row(
                  children: [
                    StoreName(),
                    Spacer(),
                    FollowStore(),
                    HSpace(factor: .5),
                    MailStore(),
                  ],
                ),
                StoreProductsType(),
              ],
            ),
          ),
          VSpace(factor: .5),
          StoreOffers(),
          VSpace(factor: .8),
          StoreTaps(),
          StoreAllProductsGrid(),
        ],
      ),
    );
  }
}
