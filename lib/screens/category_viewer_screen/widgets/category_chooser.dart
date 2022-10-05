// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/providers/categories_provider.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({
    Key? key,
    required this.catProvider,
  }) : super(key: key);

  final CategoriesProvider catProvider;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      enableFeedback: true,
      icon: Image.asset(
        'assets/icons/down-arrow.png',
        width: smallIconSize,
      ),
      underline: SizedBox(),
      elevation: 1,
      alignment: AlignmentDirectional.centerEnd,
      borderRadius: BorderRadius.circular(mediumBorderRadius),
      value: catProvider.activeCategoryId,
      items: catProvider.categories.map(
        (e) {
          return DropdownMenuItem(
            value: e.id,
            child: Text(e.title),
          );
        },
      ).toList(),
      onChanged: (v) {
        if (v is String) {
          catProvider.setActiveCategoryId(v);
        }
      },
    );
  }
}
