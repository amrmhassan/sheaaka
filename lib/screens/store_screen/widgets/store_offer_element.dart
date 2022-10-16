// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/store_screen/widgets/store_offer_photo.dart'
    as store_offer_photo;

class StoreOfferElement extends StatelessWidget {
  final OfferModel offer;
  const StoreOfferElement({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offer.active
        ? GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ProductScreen.routeName,
                  arguments: offer.productId);
            },
            child: Container(
              margin: EdgeInsets.only(
                left: kHPad / 2,
              ),
              child: Column(
                children: [
                  store_offer_photo.StoreOfferPhoto(
                    imagePath: offer.imagePath,
                    createdAt: offer.createdAt,
                    endAt: offer.endAt,
                  ),
                  VSpace(factor: .4),
                  SizedBox(
                    width: store_offer_photo.radius,
                    child: Text(
                      offer.title,
                      overflow: TextOverflow.ellipsis,
                      style: h4TextStyle.copyWith(
                        height: 1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
