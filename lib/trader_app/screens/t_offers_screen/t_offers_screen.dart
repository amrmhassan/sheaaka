// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_offers_screen/widgets/trader_offer_card.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';

class TOffersScreen extends StatelessWidget {
  static const String routeName = 't-offers-screen';
  const TOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<OfferModel> offers =
        (ModalRoute.of(context)!.settings.arguments as List<OfferModel>)
            .reversed
            .toList();
    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {},
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
            title: 'عروض المحل (خصومات)',
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(
            number: offers.length,
            trailingTitle: 'عرض',
          ),
          VSpace(factor: .5),
          Expanded(
            child: GridView.builder(
              padding:
                  EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: offers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: kHPad / 2,
                mainAxisSpacing: kHPad / 2,
              ),
              itemBuilder: (context, index) {
                OfferModel offer = offers[index];
                return TraderOfferCard(offer: offer);
              },
            ),
          ),
        ],
      ),
    );
  }
}
