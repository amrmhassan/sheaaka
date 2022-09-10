// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';
import 'package:project/screens/product_screen/widgets/product_size_element.dart';

class ChooseProductSize extends StatelessWidget {
  final List<Sizes> availableSizes;
  const ChooseProductSize({
    Key? key,
    required this.availableSizes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductPropsChoose(
      title: 'الحجم',
      child: Row(
        children: availableSizes
            .map((e) => ProductSizeElement(
                  size: e,
                  active: e == Sizes.m,
                ))
            .toList(),
      ),
    );
  }
}
