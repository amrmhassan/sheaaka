// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/offer_timer.dart';
import 'package:project/screens/home_screen/widgets/post_actions.dart';
import 'package:project/screens/home_screen/widgets/post_header.dart';
import 'package:project/screens/home_screen/widgets/post_info.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/store_screen/store_screen.dart';

class FullPost extends StatelessWidget {
  final int activeDot = 0;
  final ProductModel fullPostModel;
  const FullPost({
    Key? key,
    required this.fullPostModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: fullPostModel,
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: kVPad / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, StoreScreen.routeName);
              },
              //? this will take the store logo and the store name
              child: PostHeader(
                logoImagePath: fullPostModel.store.logoImagePath,
                storeName: fullPostModel.store.name,
              ),
            ),
            VSpace(factor: 0.5),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                //? this will take the products images
                Image.asset(
                  fullPostModel.imagesPath[0],
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                //? this will take the offer bool and the offer end date
                OfferTimer(
                  offerEndDate: fullPostModel.offerEnd,
                  hasOffer: fullPostModel.hasOffer,
                ),
              ],
            ),
            VSpace(factor: .3),
            //? this will take images number and the current active image
            ImageSliderDotsContainer(
                count: fullPostModel.imagesPath.length, activeDot: activeDot),
            //? this will take the favorite bool, bookmark bool
            PostActions(
              bookMarked: fullPostModel.bookMark,
              loved: fullPostModel.favorite,
              lovesNumber: fullPostModel.lovesNumber,
            ),
            //? this will take product info , product short description
            PostInfo(
              shortDescription: fullPostModel.shortDesc,
              name: fullPostModel.name,
            ),
          ],
        ),
      ),
    );
  }
}
