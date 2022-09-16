// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/full_post_images.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/offer_timer.dart';
import 'package:project/screens/home_screen/widgets/post_actions.dart';
import 'package:project/screens/home_screen/widgets/post_header.dart';
import 'package:project/screens/home_screen/widgets/post_info.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/store_screen/store_screen.dart';

class FullPost extends StatefulWidget {
  final ProductModel fullPostModel;
  const FullPost({
    Key? key,
    required this.fullPostModel,
  }) : super(key: key);

  @override
  State<FullPost> createState() => _FullPostState();
}

class _FullPostState extends State<FullPost> {
  int activeDot = 0;
  void setActiveDot(int i) {
    setState(() {
      activeDot = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: widget.fullPostModel.id,
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: kVPad / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StoreScreen.routeName,
                  arguments: widget.fullPostModel.store.id,
                );
              },
              //? this will take the store logo and the store name
              child: PostHeader(
                logoImagePath: widget.fullPostModel.store.logoImagePath,
                storeName: widget.fullPostModel.store.name,
                offersNumber: widget.fullPostModel.store.offers
                    .where((element) => element.active)
                    .length,
              ),
            ),
            VSpace(factor: 0.5),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                //? this will take the products images
                FullPostImage(
                  imagesPath: widget.fullPostModel.imagesPath,
                  setActiveDot: setActiveDot,
                ),
                //? this will take the offer bool and the offer end date
                if (showOfferTimer())
                  OfferTimer(
                    offerEndDate: widget.fullPostModel.offerEnd,
                  ),
              ],
            ),
            VSpace(factor: .3),
            //? this will take images number and the current active image
            ImageSliderDotsContainer(
                count: widget.fullPostModel.imagesPath.length,
                activeDot: activeDot),
            //? this will take the favorite bool, bookmark bool
            PostActions(
              bookMarked: widget.fullPostModel.wishListId != null,
              loved: widget.fullPostModel.favorite,
              lovesNumber: widget.fullPostModel.lovesNumber,
              id: widget.fullPostModel.id,
            ),
            //? this will take product info , product short description
            PostInfo(
              shortDescription: widget.fullPostModel.shortDesc,
              name: widget.fullPostModel.name,
            ),
          ],
        ),
      ),
    );
  }

  bool showOfferTimer() {
    if (widget.fullPostModel.hasOffer == null) {
      return false;
    } else if (widget.fullPostModel.offerEnd == null) {
      return false;
    } else if (DateTime.now().isAfter(widget.fullPostModel.offerEnd!)) {
      return false;
    } else {
      return true;
    }
  }
}
