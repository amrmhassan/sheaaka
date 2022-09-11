// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/wishlist_screen/widgets/brand.dart';
import 'package:project/screens/wishlist_screen/widgets/h_post_desc.dart';
import 'package:project/screens/wishlist_screen/widgets/h_post_info.dart';

class HorizontalPost extends StatelessWidget {
  final ProductModel product;
  const HorizontalPost({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      margin: EdgeInsets.only(bottom: kVPad),
      height: 130,
      backgroundColor: kLightColor.withOpacity(.3),
      child: Row(
        children: [
          Image.asset(
            product.imagesPath[0],
            fit: BoxFit.cover,
            width: 130,
            alignment: Alignment.topCenter,
          ),
          Expanded(
            child: PaddingWrapper(
              padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HPostInfo(
                    name: product.name,
                    storeName: product.store.name,
                  ),
                  VSpace(factor: .1),
                  HPostDesc(
                    desc: product.fullDesc,
                  ),
                  VSpace(factor: .7),
                  Row(
                    children: [
                      Brand(
                        brand: product.brand,
                      ),
                      Spacer(),
                      if (product.rating != null)
                        Rating(
                          rating: product.rating,
                        ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
