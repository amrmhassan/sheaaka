// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/helpers/responsive.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/screens/product_screen/product_screen.dart';

class UserAdsCard extends StatelessWidget {
  final AdsModel adsModel;
  const UserAdsCard({
    Key? key,
    required this.adsModel,
  }) : super(key: key);

  double getFullCardHeight(BuildContext context) {
    final double fullWidth = Responsive.getWidth(context) / 1.8;
    return fullWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: kHPad / 2),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductScreen.routeName,
            arguments: adsModel.productId,
          );
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: getFullCardHeight(context),
          height: Responsive.getWidth(context) / 1.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(smallBorderRadius),
            color: Colors.white,
            boxShadow: [
              defaultBoxShadow,
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: FadeInImage(
                  placeholder: loadingImage,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    adsModel.imagePath,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPad / 2,
                  ),
                  child: Row(
                    children: [
                      if (adsModel.storeLogo != null)
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(
                              width: 1,
                              color: kPrimaryColor,
                            ),
                          ),
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: Image.network(
                              adsModel.storeLogo!,
                              width: largeIconSize,
                              height: largeIconSize,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      HSpace(factor: .2),
                      Expanded(
                        child: Text(
                          adsModel.storeName,
                          style: h3TextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        adsModel.productName,
                        style: h4TextStyleInactive,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
