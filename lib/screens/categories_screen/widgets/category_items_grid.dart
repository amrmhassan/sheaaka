// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/categories.dart';
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
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: kHPad),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: kHPad / 2,
          crossAxisSpacing: kHPad,
          crossAxisCount: 2,
          childAspectRatio: 2.9,
        ),
        children: categories
            .map((e) => CategoryItem(iconPath: e.icon, title: e.title))
            .toList(),
      ),
    );
  }
}
