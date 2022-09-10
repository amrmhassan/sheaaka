// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/free_colored_space.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/n_of_comments.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/widgets/add_to_cart_button.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';
import 'package:project/screens/product_screen/widgets/open_product_comments_button.dart';
import 'package:project/screens/product_screen/widgets/product_description_text.dart';
import 'package:project/screens/product_screen/widgets/product_name.dart';
import 'package:project/global/widgets/rating.dart';
import 'package:project/screens/product_screen/widgets/remain_in_stock.dart';
import 'package:project/utils/bools.dart';

class ProductScreen extends StatelessWidget {
  final int activeDot = 0;

  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/product-screen';

  @override
  Widget build(BuildContext context) {
    final productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    var image = Image.asset(
      productModel.imagesPath[0],
      width: double.infinity,
      fit: BoxFit.cover,
    );
    return ScreensWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      image,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            rightIcon: AppBarIcon(
                              color: boolifyNull(productModel.bookMark)
                                  ? kPrimaryColor
                                  : kBlackColor,
                              iconName: boolifyNull(productModel.bookMark)
                                  ? 'bookmark'
                                  : 'book-mark',
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          // Spacer(),
                        ],
                      ),
                      (productModel.brand == null)
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
                                  productModel.brand ?? '',
                                  style: h3TextStyle,
                                ),
                              ),
                            ),
                    ],
                  ),
                  VSpace(factor: .5),
                  //? this will take
                  ImageSliderDotsContainer(
                    activeDot: activeDot,
                    count: productModel.imagesPath.length,
                  ),
                  VSpace(factor: .5),
                  PaddingWrapper(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProductName(
                              name: productModel.name,
                            ),
                            Spacer(),
                            productModel.oldPrice == null
                                ? SizedBox()
                                : ProductCartPrice(
                                    active: false,
                                    color: kInActiveTextColor,
                                    fontSize: 12,
                                    price: productModel.oldPrice!,
                                  ),
                            HSpace(factor: .3),
                            ProductCartPrice(
                              fontWeight: FontWeight.bold,
                              fontSize: h2TextSize,
                              price: productModel.price,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            productModel.remainingNumber == null
                                ? SizedBox()
                                : RemainInStock(
                                    num: productModel.remainingNumber!),
                            Spacer(),
                            productModel.rating == null
                                ? SizedBox()
                                : Rating(
                                    rating: productModel.rating,
                                  ),
                            productModel.nOfComments == null
                                ? SizedBox()
                                : HSpace(factor: .5),
                            productModel.nOfComments == null
                                ? SizedBox()
                                : NOfComments(num: productModel.nOfComments!),
                          ],
                        ),
                        VSpace(factor: .5),
                        ProductDescriptionText(
                          desc: productModel.fullDesc ?? 'لا يوجد وصف',
                        ),
                        VSpace(factor: .5),
                        productModel.remainingNumber != null &&
                                productModel.remainingNumber! < 1
                            ? SizedBox()
                            : Column(
                                children: [
                                  ChooseProductSize(
                                    availableSizes: productModel.availableSize,
                                  ),
                                  VSpace(factor: .5),
                                  ChooseProductColor(),
                                  VSpace(factor: .5),
                                ],
                              ),
                      ],
                    ),
                  ),
                  FreeColoredSpace(
                    number: 50,
                    margin: 5,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: kHPad,
              vertical: kVPad / 2,
            ),
            child: Row(
              children: [
                AddToCartButton(),
                HSpace(factor: .5),
                OpenProductCommentsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
