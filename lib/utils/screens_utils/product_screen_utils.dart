// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/brands_constants.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/n_of_comments.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/product_screen/widgets/remain_in_stock.dart';

//? before applying the offer
Widget handleShowOldPrice(ProductModel productModel, OfferModel? offerModel) {
  return offerModel == null
      ? SizedBox()
      : ProductCartPrice(
          active: false,
          color: kInActiveTextColor,
          fontSize: 12,
          price:
              productModel.price * (1 / (offerModel.discountPercentage / 100)),
        );
}

Widget handleShowBrand(ProductModel productModel) {
  return (productModel.brand == null ||
          (productModel.brand!.name.isEmpty &&
              productModel.brand!.icon == null))
      ? SizedBox()
      : Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: kHPad / 1.5,
              vertical: kVPad / 3,
            ),
            alignment: Alignment.bottomLeft,
            color: kLightColor,
            child: Text(
              productModel.brand == null
                  ? emptyBrand.name
                  : productModel.brand!.name,
              style: h4TextStyleInactive,
            ),
          ),
        );
}

bool addToCartActiveButton(int? v) {
  if (v == null) {
    return true;
  } else if (v > 0) {
    return true;
  } else {
    return false;
  }
}

Row handleSecondaryProductInfo(ProductModel productModel) {
  return Row(
    children: [
      productModel.remainingNumber == null
          ? SizedBox()
          : RemainInStock(
              num: productModel.remainingNumber!,
            ),
      Spacer(),
      productModel.rating == null
          ? SizedBox()
          : Rating(
              rating: productModel.rating,
            ),
      productModel.nOfComments == null ? SizedBox() : HSpace(factor: .5),
      productModel.nOfComments == null
          ? SizedBox()
          : NOfComments(num: productModel.nOfComments!),
    ],
  );
}
