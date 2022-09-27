// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';

class ProductSizeColor extends StatelessWidget {
  final Function(int index) setActiveColor;
  final int? activeColorIndex;
  final Function(int index) setActiveSize;
  final int? activeSizeIndex;

  const ProductSizeColor({
    Key? key,
    required this.productModel,
    required this.setActiveColor,
    required this.setActiveSize,
    required this.activeColorIndex,
    required this.activeSizeIndex,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (productModel.availableSize != null &&
            productModel.availableSize!.isNotEmpty)
          ChooseProductSize(
            availableSizes: productModel.availableSize,
            setActiveSize: setActiveSize,
            activeSizeIndex: activeSizeIndex,
          ),
        VSpace(factor: .5),
        if (productModel.availableColors != null &&
            productModel.availableColors!.isNotEmpty)
          ChooseProductColor(
            colors: productModel.availableColors,
            setActiveColor: setActiveColor,
            activeColorIndex: activeColorIndex,
          ),
        VSpace(factor: .5),
      ],
    );
  }
}
