// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/product_screen/product_screen.dart';

class ProductSuggestionCard extends StatelessWidget {
  final String imagePath;
  final double price;
  final String productId;
  final String name;

  const ProductSuggestionCard({
    Key? key,
    required this.imagePath,
    required this.price,
    required this.productId,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, ProductScreen.routeName,
            arguments: productId);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FadeInImage(
              placeholder: loadingImage,
              image: NetworkImage(
                imagePath,
              ),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: kHPad / 2,
                vertical: kVPad / 2,
              ),
              color: Colors.black.withOpacity(.6),
              child: ProductCartPrice(
                price: price,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // if (kDebugMode)
            //   Positioned(
            //     top: 0,
            //     child: Text(
            //       name,
            //       style: TextStyle(color: Colors.white),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
