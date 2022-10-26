// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/trend_screen/widgets/fire_section.dart';
import 'package:project/screens/trend_screen/widgets/user_ads_card.dart';
import 'package:project/screens/trend_screen/widgets/user_offer_card.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

//? this screen will have the trending products depending on the gender
//? and the best offers
//? it will has all sorts of products cards like Trending, best offers....

class TrendScreen extends StatefulWidget {
  static const String routeName = '/trend-screen';
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  //? user gender
  String activeGenderId = gendersConstants.first.id;
  void setActiveGender(String g) {
    setState(() {
      activeGenderId = g;
    });
  }

  @override
  Widget build(BuildContext context) {
    //? ads
    var ads = Provider.of<AdsProvider>(context, listen: false).ads;
    var neededAds = ads.length < 3 ? ads : ads.getRange(0, 3);
    //? offers
    var offers = Provider.of<StoreProvider>(context).offers;
    var neededOffers = offers.length < 3 ? offers : offers.getRange(0, 3);

    return Column(
      children: [
        VSpace(factor: .5),
        HLine(),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              FireSection(
                children: [
                  ...neededAds.map(
                    (e) => UserAdsCard(adsModel: e),
                  ),
                ],
                title: 'إعلانات',
                onTap: () {},
              ),
              VSpace(),
              FireSection(
                children: [
                  ...neededOffers.map(
                    (e) => UserOfferCard(
                      offerModel: e,
                    ),
                  ),
                ],
                onTap: () {},
                title: 'أفضل العروض',
              ),
              VSpace(),
            ],
          ),
        ),
      ],
    );
  }
}
