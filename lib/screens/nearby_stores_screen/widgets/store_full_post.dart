// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/n_of_followers.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/store_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/nearby_stores_screen/widgets/store_distance.dart';
import 'package:project/screens/nearby_stores_screen/widgets/trader_photo_on_store_post.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/screens/store_screen/widgets/store_products_type.dart';

class StoreFullPost extends StatelessWidget {
  final StoreModel storeModel;
  final LatLng myLocation;

  const StoreFullPost({
    Key? key,
    required this.storeModel,
    required this.myLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var coverImage = FadeInImage(
      fadeInDuration: fadeInImageDuration,
      fadeOutDuration: fadeInImageDuration,
      placeholder: loadingImage,
      image: NetworkImage(
        storeModel.coverImagePath,
      ),
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: double.infinity,
      imageErrorBuilder: (context, error, stackTrace) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey.withOpacity(.5),
          child: Opacity(
            opacity: .5,
            child: Image.asset(
              'assets/icons/image.png',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, StoreScreen.routeName,
            arguments: storeModel.id);
      },
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                coverImage,
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.black.withOpacity(.5),
                    width: Responsive.getWidth(context),
                    child: PaddingWrapper(
                      alignment: Alignment.topRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VSpace(factor: .5),
                          Text(
                            storeModel.name,
                            style: h3TextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              if (storeModel.desc != null)
                                Row(
                                  children: [
                                    StoreProductsType(
                                      color: Colors.white,
                                      title: storeModel.desc,
                                    ),
                                    HSpace(),
                                  ],
                                ),
                              if (storeModel.rating != null)
                                Rating(
                                  color: Colors.white,
                                  rating: storeModel.rating,
                                ),
                              Spacer(),
                              if (storeModel.followers > 0)
                                NOfFollowers(
                                  num: storeModel.followers,
                                  color: Colors.white,
                                ),
                              HSpace(),
                              StoreDistance(
                                distance: storeModel.distance ?? 0,
                              ),
                            ],
                          ),
                          VSpace(factor: .4),
                        ],
                      ),
                    ),
                  ),
                ),
                TraderPhotoOnStorePost(
                  logoPath: storeModel.logoImagePath,
                ),
              ],
            ),
          ),
          VSpace(factor: .5),
        ],
      ),
    );
  }
}
