// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/free_colored_space.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/home_screen/widgets/full_post_images.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dots_container.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/widgets/add_to_cart_button.dart';
import 'package:project/screens/product_screen/widgets/open_product_comments_button.dart';
import 'package:project/screens/product_screen/widgets/product_description_text.dart';
import 'package:project/screens/product_screen/widgets/product_name.dart';
import 'package:project/screens/product_screen/widgets/product_screen_app_bar.dart';
import 'package:project/screens/product_screen/widgets/product_size_color.dart';
import 'package:project/utils/screens_utils/product_screen_utils.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = '/product-screen';

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activeDot = 0;
  void setActiveDot(int i) {
    setState(() {
      activeDot = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productModelId = ModalRoute.of(context)!.settings.arguments as String;
    var productModel =
        Provider.of<ProductsProvider>(context).findProductById(productModelId);
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
                      FullPostImage(
                          imagesPath: productModel.imagesPath,
                          setActiveDot: setActiveDot),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductScreenAppBar(
                            bookMark: productModel.wishListId != null,
                            id: productModel.id,
                          ),
                        ],
                      ),
                      handleShowBrand(productModel),
                    ],
                  ),
                  VSpace(factor: .5),
                  ImageSliderDotsContainer(
                    activeDot: activeDot,
                    count: productModel.imagesPath.length,
                  ),
                  VSpace(factor: .5),
                  PaddingWrapper(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? this row is for the name, price
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProductName(
                              name: productModel.name,
                            ),
                            Spacer(),
                            handleShowOldPrice(productModel),
                            HSpace(factor: .3),
                            ProductCartPrice(
                              fontWeight: FontWeight.bold,
                              fontSize: h2TextSize,
                              price: productModel.price,
                            ),
                          ],
                        ),
                        //? this row is for remaining in stock, rating, number of comments
                        handleSecondaryProductInfo(productModel),
                        VSpace(factor: .5),
                        ProductDescriptionText(
                          desc: productModel.fullDesc ?? 'لا يوجد وصف',
                        ),
                        VSpace(factor: .5),
                        productModel.remainingNumber != null &&
                                productModel.remainingNumber! < 1
                            ? SizedBox()
                            : ProductSizeColor(productModel: productModel),
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
                AddToCartButton(
                  active: addToCartActiveButton(productModel.remainingNumber),
                ),
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
