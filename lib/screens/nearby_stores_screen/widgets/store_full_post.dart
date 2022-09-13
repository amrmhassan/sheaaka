// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/n_of_followers.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/nearby_stores_screen/widgets/store_distance.dart';
import 'package:project/screens/nearby_stores_screen/widgets/trader_photo_on_store_post.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/screens/store_screen/widgets/store_products_type.dart';

class StoreFullPost extends StatelessWidget {
  const StoreFullPost({
    Key? key,
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
                  'assets/images/store1.jpg',
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
                            'نيو فاشون',
                            style: h3TextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              StoreProductsType(
                                color: Colors.white,
                                title: 'ملابس شباب',
                              ),
                              HSpace(),
                              Rating(color: Colors.white),
                              HSpace(),
                              NOfFollowers(num: 5, color: Colors.white),
                              Spacer(),
                              StoreDistance(),
                            ],
                          ),
                          VSpace(factor: .4),
                        ],
                      ),
                    ),
                  ),
                ),
                TraderPhotoOnStorePost(),
              ],
            ),
          ),
          VSpace(factor: .5),
        ],
      ),
    );
  }
}
