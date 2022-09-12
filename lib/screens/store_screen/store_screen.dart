// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/store_model.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/global/widgets/n_of_followers.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/screens/store_screen/widgets/follow_store.dart';
import 'package:project/screens/store_screen/widgets/mail_store.dart';
import 'package:project/screens/store_screen/widgets/store_all_products_grid.dart';
import 'package:project/screens/store_screen/widgets/store_category_element.dart';
import 'package:project/screens/store_screen/widgets/store_name.dart';
import 'package:project/screens/store_screen/widgets/store_offers.dart';
import 'package:project/screens/store_screen/widgets/store_page_header.dart';
import 'package:project/screens/store_screen/widgets/store_products_type.dart';
import 'package:project/screens/store_screen/widgets/taps.dart';
import 'package:provider/provider.dart';

const double storeLogoRadius = 100;
const double storeTitleHSpace = kHPad / 2;

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);
  static const String routeName = '/store-screen';

  @override
  Widget build(BuildContext context) {
    String storeId = ModalRoute.of(context)!.settings.arguments as String;
    StoreModel storeModel =
        Provider.of<StoreProvider>(context).getStoreById(storeId);

    return ScreensWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StorePageHeader(
            coverImagePath: storeModel.coverImagePath,
            logoImagePath: storeModel.logoImagePath,
          ),
          PaddingWrapper(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VSpace(factor: .5),
                Row(
                  children: [
                    Spacer(),
                    NOfFollowers(num: storeModel.followers),
                    if (storeModel.rating != null) HSpace(factor: .5),
                    if (storeModel.rating != null)
                      Rating(
                        rating: storeModel.rating,
                      ),
                  ],
                ),
                VSpace(factor: .5),
                Row(
                  children: [
                    StoreName(
                      name: storeModel.name,
                    ),
                    Spacer(),
                    FollowStore(),
                    HSpace(factor: .5),
                    MailStore(),
                  ],
                ),
                StoreProductsType(title: storeModel.desc),
              ],
            ),
          ),
          if (storeModel.offers.isNotEmpty) VSpace(factor: .5),
          if (storeModel.offers.isNotEmpty)
            StoreOffers(offers: storeModel.offers),
          VSpace(factor: .8),
          Taps(
            taps: [
              SizedBox(width: storeTitleHSpace),
              StoreCategoryElement(active: true, title: 'الكل'),
              StoreCategoryElement(title: 'الأشهر'),
              StoreCategoryElement(title: 'الأفضل'),
              SizedBox(width: storeTitleHSpace),
            ],
          ),
          StoreAllProductsGrid(),
        ],
      ),
    );
  }
}
