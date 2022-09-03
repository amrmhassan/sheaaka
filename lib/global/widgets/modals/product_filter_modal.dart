// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/modal_wrapper/widgets/choose_product_type.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';

class ProductFiltersModal extends StatelessWidget {
  const ProductFiltersModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChooseProductSize(),
        VSpace(),
        ChooseProductColor(),
        VSpace(),
        ChooseProductType(),
      ],
    );
  }
}
