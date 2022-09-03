// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';
import 'package:project/screens/product_screen/widgets/product_size_element.dart';

class ChooseProductSize extends StatelessWidget {
  const ChooseProductSize({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductPropsChoose(
      title: 'الحجم',
      child: Row(
        children: productSizes
            .map((e) => ProductSizeElement(
                  title: e,
                  active: e == 'Xll',
                ))
            .toList(),
      ),
    );
  }
}
