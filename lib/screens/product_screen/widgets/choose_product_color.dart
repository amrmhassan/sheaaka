// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/screens/product_screen/widgets/product_color_element.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';

class ChooseProductColor extends StatelessWidget {
  final List<Color>? colors;

  const ChooseProductColor({
    Key? key,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedColorIndex = 1;
    return colors == null
        ? SizedBox()
        : ProductPropsChoose(
            title: 'اللون',
            child: Row(
              children: colors!
                  .map(
                    (e) => ProductColorElement(
                      color: e,
                      active: selectedColorIndex == colors!.indexOf(e),
                      border: e == productColors[0],
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
