// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/categories_screen/widgets/category_item.dart';

class CategoryItemsGrid extends StatelessWidget {
  const CategoryItemsGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        padding: EdgeInsets.symmetric(horizontal: kHPad),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: kHPad,
          crossAxisSpacing: kHPad,
          crossAxisCount: 2,
          childAspectRatio: 2.7,
        ),
        children: [
          CategoryItem(
            iconName: 'shirt',
            title: 'تيشيرت',
          ),
          CategoryItem(
            iconName: 'polo-shirt',
            title: 'بولو',
          ),
          CategoryItem(
            iconName: 'trousers',
            title: 'شروال',
          ),
          CategoryItem(
            iconName: 'jeans',
            title: 'جينز',
          ),
          CategoryItem(
            iconName: 'cloth',
            title: 'قميص',
          ),
          CategoryItem(
            iconName: 'shorts',
            title: 'شورت',
          ),
          CategoryItem(
            iconName: 'socks',
            title: 'جوارب',
          ),
          CategoryItem(
            iconName: 'baseball-cap',
            title: 'قبعة',
          ),
        ],
      ),
    );
  }
}
