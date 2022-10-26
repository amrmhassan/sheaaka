// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/trend_screen/widgets/user_ads_card.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
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
    var ads = Provider.of<AdsProvider>(context, listen: false).ads;
    return Column(
      children: [
        VSpace(factor: .5),
        HLine(),
        GroupHeader(
          title: 'إعلانات',
          subTitle: 'الكل',
          onTap: () {},
        ),
        Container(
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                HSpace(),
                ...ads.map(
                  (e) => UserAdsCard(adsModel: e),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
