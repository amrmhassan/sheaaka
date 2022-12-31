// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/utils/general_utils.dart';

class UserOfferCard extends StatelessWidget {
  final OfferModel offerModel;
  const UserOfferCard({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kHPad),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductScreen.routeName,
            arguments: offerModel.productId,
          );
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: Responsive.getWidth(context) / 1.6,
          height: Responsive.getWidth(context) / 1.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallBorderRadius),
            color: Colors.white,
            boxShadow: [liteBoxShadow],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Image.network(
                      offerModel.imagePath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      right: kHPad / 2,
                      top: kVPad / 2,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/discount.png',
                            width: largeIconSize * 1.5,
                          ),
                          Text(
                            '-%${doubleToString(
                              offerModel.discountPercentage * 100,
                              0,
                            )}',
                            style: h3TextStyle.copyWith(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: PaddingWrapper(
                  padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                  child: Row(
                    children: [
                      Text(
                        offerModel.productName,
                        style: h3TextStyle,
                      ),
                      Spacer(),
                      Text(
                        dateToString(offerModel.endAt),
                        style: h4TextStyleInactive,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
