// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';
import 'package:project/screens/product_screen/widgets/product_size_element.dart';

class ChooseProductSize extends StatelessWidget {
  final List<Sizes>? availableSizes;
  final Function(int index) setActiveSize;
  final int? activeSizeIndex;

  const ChooseProductSize({
    Key? key,
    this.availableSizes,
    required this.activeSizeIndex,
    required this.setActiveSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return availableSizes == null
        ? SizedBox()
        : ProductPropsChoose(
            title: 'الحجم',
            child: Row(
              children: availableSizes!.map(
                (e) {
                  int i = availableSizes!.indexWhere((element) => element == e);
                  return ProductSizeElement(
                    size: e,
                    active: activeSizeIndex == i,
                    onTap: () {
                      setActiveSize(i);
                    },
                  );
                },
              ).toList(),
            ),
          );
  }
}
