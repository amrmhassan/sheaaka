// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/screens/store_screen/widgets/store_offer_photo.dart';

class StoreOfferElement extends StatelessWidget {
  final OfferModel offer;
  const StoreOfferElement({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offer.endAt.isBefore(DateTime.now())
        ? SizedBox()
        : Container(
            margin: EdgeInsets.only(
              left: kHPad / 2,
            ),
            child: Column(
              children: [
                StoreOfferPhoto(
                  imagePath: offer.imagePath,
                  createdAt: offer.createdAt,
                  endAt: offer.endAt,
                ),
                VSpace(factor: .4),
                Text(
                  offer.title,
                  style: h4TextStyle.copyWith(
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
  }
}
