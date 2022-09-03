// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/product_filters/widgets/apply_filter_button.dart';
import 'package:project/global/widgets/product_filters/widgets/choose_product_type.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/product_screen/widgets/choose_product_color.dart';
import 'package:project/screens/product_screen/widgets/choose_product_size.dart';

class ProductFiltersModal extends StatelessWidget {
  const ProductFiltersModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(largeBorderRadius),
          topRight: Radius.circular(largeBorderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          VSpace(),
          HLine(
            width: 4,
            color: kSecondaryColor.withOpacity(.4),
            borderRadius: 50,
            widthFactor: .3,
          ),
          VSpace(factor: 2),
          ChooseProductSize(),
          VSpace(),
          ChooseProductColor(),
          VSpace(),
          ChooseProductType(),
          VSpace(factor: 2),
          ApplyFilterButton(),
          VSpace(factor: 2),
        ],
      ),
    );
  }
}
