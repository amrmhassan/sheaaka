// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class TraderOfferCard extends StatelessWidget {
  const TraderOfferCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          mediumBorderRadius,
        ),
        boxShadow: [
          liteBoxShadow,
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              offer.imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kHPad / 2,
              vertical: kVPad / 2,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      offer.title,
                    ),
                    Spacer(),
                    Text(
                      '-%${offer.discountPercentage.toStringAsFixed(0)}',
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      dateToString(offer.endAt),
                      style: h4TextStyleInactive.copyWith(
                        color: kTraderSecondaryColor.withOpacity(.8),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
