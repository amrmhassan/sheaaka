// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/screens/store_screen/widgets/store_offer_element.dart';

class StoreOffers extends StatelessWidget {
  const StoreOffers({
    Key? key,
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
          StoreOfferElement(start: true),
          StoreOfferElement(),
          StoreOfferElement(),
          StoreOfferElement(),
          StoreOfferElement(),
          StoreOfferElement(),
        ],
      ),
    );
  }
}
