// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/full_post_images.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/offer_timer.dart';
import 'package:project/screens/home_screen/widgets/post_actions.dart';
import 'package:project/screens/home_screen/widgets/post_header.dart';
import 'package:project/screens/home_screen/widgets/post_info.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/utils/screens_utils/post_actions_utils.dart';
import 'package:provider/provider.dart';

class FullPost extends StatefulWidget {
  final ProductModel fullPostModel;
  final String? wishlistItemId;

  const FullPost({
    Key? key,
    required this.fullPostModel,
    required this.wishlistItemId,
  }) : super(key: key);

  @override
  State<FullPost> createState() => _FullPostState();
}

class _FullPostState extends State<FullPost> {
  bool showOverLayHeart = false;
  int activeDot = 0;
  void setActiveDot(int i) {
    setState(() {
      activeDot = i;
    });
  }

//? to handle the post double tap
  void handlePostDoubleTap() {
    // if(widget.fullPostModel)
    bool loved = Provider.of<ProductsProvider>(context, listen: false)
        .favoriteProductsIds
        .contains(widget.fullPostModel.id);
    if (!loved) {
      toggleLove(context, widget.fullPostModel.id);
      setState(() {
        showOverLayHeart = true;
      });
      Future.delayed(Duration(milliseconds: 800)).then((value) {
        setState(() {
          showOverLayHeart = false;
        });
      });
    }
    //! show a temprary heart icon
  }

  @override
  Widget build(BuildContext context) {
    var storesProvider = Provider.of<StoreProvider>(context);
    var storeOffers = storesProvider.offers
        .where((element) => element.storeId == widget.fullPostModel.storeId);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: widget.fullPostModel.id,
        );
      },
      onDoubleTap: handlePostDoubleTap,
      child: Container(
        padding: EdgeInsets.only(top: kVPad / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(widget.fullPostModel.createdAt.toString()),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  StoreScreen.routeName,
                  arguments: widget.fullPostModel.storeId,
                );
              },
              //? this will take the store logo and the store name
              child: PostHeader(
                logoImagePath: widget.fullPostModel.storeLogo,
                storeName: widget.fullPostModel.storeName,
                offersNumber: storeOffers.length,
              ),
            ),
            VSpace(factor: 0.5),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                //? this will take the products images
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FullPostImage(
                      imagesPath: widget.fullPostModel.imagesPath,
                      setActiveDot: setActiveDot,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 190),
                      width: showOverLayHeart ? ultraLargeIconSize * 3 : 0,
                      height: showOverLayHeart ? ultraLargeIconSize * 3 : 0,
                      child: Image.asset(
                        'assets/icons/heart2.png',
                        color: kLoveColor,
                      ),
                    )
                  ],
                ),
                //? this will take the offer bool and the offer end date
                if (widget.fullPostModel.offerId != null)
                  OfferTimer(
                    offerEndDate: widget.fullPostModel.offerEnd,
                    offerStartDate: widget.fullPostModel.offerStarted,
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
              bookMarked: widget.wishlistItemId != null,
              lovesNumber: widget.fullPostModel.lovesNumber,
              productId: widget.fullPostModel.id,
              wishlistItemId: widget.wishlistItemId,
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
}
