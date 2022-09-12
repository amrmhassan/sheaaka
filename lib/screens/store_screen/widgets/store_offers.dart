// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/screens/store_screen/widgets/store_offer_element.dart';

class StoreOffers extends StatelessWidget {
  final List<OfferModel> offers;
  const StoreOffers({
    Key? key,
    required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HSpace(),
          ...offers
              .map((e) => StoreOfferElement(
                    offer: e,
                  ))
              .toList(),
          HSpace(),
        ],
      ),
    );
  }
}
