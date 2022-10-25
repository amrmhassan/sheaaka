// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_ads_screen/t_add_ads_screen.dart';
import 'package:project/trader_app/screens/t_ads_screen/widgets/ads_card.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';

class TAdsScreen extends StatelessWidget {
  static const String routeName = 't-ads-screen';
  const TAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<AdsModel> ads =
        ModalRoute.of(context)!.settings.arguments as List<AdsModel>;
    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {
          Navigator.pushNamed(context, TAddAdsScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(largePadding),
          child: Image.asset(
            'assets/icons/plus.png',
            color: Colors.white,
          ),
        ),
      ),
      child: Column(
        children: [
          CustomAppBar(
            traderStyle: true,
            rightTitle: true,
            title: 'إعلانات ممولة',
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(
            number: ads.length,
            trailingTitle: 'عرض',
          ),
          VSpace(factor: .5),
          Expanded(
            child: ListView(
              children: ads
                  .map(
                    (e) => AdsCard(
                      adsModel: e,
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
