// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/category_viewer_screen/widgets/product_category_data.dart';
import 'package:project/screens/product_screen/product_screen.dart';

class CategoryProductCart extends StatelessWidget {
  const CategoryProductCart({
    Key? key,
    required this.p,
  }) : super(key: key);

  final ProductModel p;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName, arguments: p.id);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
          color: Colors.white,
          boxShadow: [
            liteBoxShadow,
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Image.asset(
                    p.imagesPath[0],
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ultraLargePadding / 2),
                        margin: EdgeInsets.symmetric(
                          horizontal: kHPad / 2,
                          vertical: kVPad / 2,
                        ),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(500),
                          boxShadow: [liteBoxShadow],
                        ),
                        child: Image.asset(
                          'assets/icons/book-mark.png',
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProductCategoryData(p: p),
          ],
        ),
      ),
    );
  }
}
