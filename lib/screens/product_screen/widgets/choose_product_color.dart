// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/product_screen/widgets/product_color_element.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';

class ChooseProductColor extends StatelessWidget {
  final List<Color>? colors;
  final Function(int index) setActiveColor;
  final int? activeColorIndex;
  const ChooseProductColor({
    Key? key,
    required this.colors,
    required this.activeColorIndex,
    required this.setActiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return colors == null
        ? SizedBox()
        : ProductPropsChoose(
            title: 'اللون',
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colors!.map(
                  (e) {
                    int i = colors!.indexWhere(
                      (element) => element == e,
                    );
                    return ProductColorElement(
                      color: e,
                      active: activeColorIndex == i,
                      border: e == Colors.white,
                      onTap: () {
                        setActiveColor(i);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          );
  }
}
