// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';

class ProductSizeColor extends StatelessWidget {
  const ProductSizeColor({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChooseProductSize(
          availableSizes: productModel.availableSize,
        ),
        VSpace(factor: .5),
        ChooseProductColor(
          colors: productModel.availableColors,
        ),
        VSpace(factor: .5),
      ],
    );
  }
}
