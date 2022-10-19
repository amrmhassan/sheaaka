// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';

class ProductCategoryData extends StatelessWidget {
  const ProductCategoryData({
    Key? key,
    required this.p,
  }) : super(key: key);

  final ProductModel p;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad / 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (p.offerId != null)
                  ProductCartPrice(
                    price: p.price,
                    active: false,
                    color: kSecondaryColor,
                    fontSize: h4TextSize,
                  ),
                Spacer(),
                ProductCartPrice(
                  price: p.price,
                  fontSize: h3TextSize,
                ),
              ],
            ),
            VSpace(factor: .3),
            if (p.shortDesc != null)
              Text(
                p.shortDesc!,
                overflow: TextOverflow.ellipsis,
                style: h4TextStyleInactive.copyWith(height: 1),
              ),
          ],
        ),
      ),
    );
  }
}
