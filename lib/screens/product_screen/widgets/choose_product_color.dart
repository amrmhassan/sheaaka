import 'package:flutter/material.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/screens/product_screen/widgets/product_color_element.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';

class ChooseProductColor extends StatelessWidget {
  const ChooseProductColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductPropsChoose(
      title: 'اللون',
      child: Row(
        children: [
          ProductColorElement(
            color: productColors[0],
            border: true,
          ),
          ProductColorElement(
            color: productColors[1],
            active: true,
          ),
          ProductColorElement(
            color: productColors[2],
          ),
          ProductColorElement(
            color: productColors[3],
          ),
          ProductColorElement(
            color: productColors[4],
          ),
        ],
      ),
    );
  }
}
