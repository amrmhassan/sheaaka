// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/wishlist_screen/widgets/brand.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/number_of_product_photos.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/product_name_price.dart';

const double productImageDimensions = 130;

class TraderProductCard extends StatelessWidget {
  const TraderProductCard({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductScreen.routeName,
            arguments: productModel.id);
      },
      child: Container(
        height: productImageDimensions,
        margin: EdgeInsets.only(bottom: kVPad / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              imageErrorBuilder: (context, error, stackTrace) {
                return Image(image: loadingImage);
              },
              placeholder: loadingImage,
              image: NetworkImage(
                productModel.imagesPath[0],
              ),
              width: productImageDimensions,
              height: productImageDimensions,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            Expanded(
              child: PaddingWrapper(
                padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
                child: Column(
                  children: [
                    VSpace(factor: .5),
                    ProductNamePrice(
                      name: productModel.name,
                      price: productModel.price,
                    ),
                    VSpace(factor: .3),
                    Row(
                      children: [
                        NumberOfProductPhotos(
                          number: productModel.imagesPath.length,
                        ),
                        Spacer(),
                        Brand(
                          brand: productModel.brand,
                          color: kTraderSecondaryColor,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        productModel.fullDesc ??
                            productModel.shortDesc ??
                            'لا يوجد وصف',
                        style: h4TextStyleInactive.copyWith(
                          color: kTraderSecondaryColor.withOpacity(.6),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
