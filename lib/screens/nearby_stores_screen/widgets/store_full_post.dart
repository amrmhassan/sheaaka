// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/locations.dart';
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

  const StoreFullPost({
    Key? key,
    required this.storeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, StoreScreen.routeName);
      },
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                Image.asset(
                  storeModel.coverImagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
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
                              StoreProductsType(
                                color: Colors.white,
                                title: storeModel.desc,
                              ),
                              HSpace(),
                              Rating(
                                color: Colors.white,
                                rating: storeModel.rating,
                              ),
                              Spacer(),
                              NOfFollowers(
                                num: storeModel.followers,
                                color: Colors.white,
                              ),
                              HSpace(),
                              StoreDistance(
                                storeLocation: storeModel.location,
                                currentLocation: myLocation,
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
