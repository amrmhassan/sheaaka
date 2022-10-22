// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/providers/categories_provider.dart';
import 'package:project/utils/categories_utiles.dart';

class SizeChooser extends StatelessWidget {
  const SizeChooser({
    Key? key,
    required this.catProvider,
  }) : super(key: key);

  final CategoriesProvider catProvider;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('الحجم'),
      enableFeedback: true,
      icon: Image.asset(
        'assets/icons/down-arrow.png',
        width: smallIconSize,
      ),
      underline: SizedBox(),
      elevation: 1,
      alignment: AlignmentDirectional.centerEnd,
      borderRadius: BorderRadius.circular(mediumBorderRadius),
      value: catProvider.activeSizeIndex,
      items: catProvider.sizes.map(
        (e) {
          return DropdownMenuItem(
            value: e.index,
            child: Text(e.name.toUpperCase() ==
                    catProvider.sizes.first.name.toUpperCase()
                ? 'All'
                : e.name.toUpperCase()),
          );
        },
      ).toList(),
      onChanged: (v) {
        if (v is int) {
          catProvider.setActiveSize(v);
          updateCategories(context);
        }
      },
    );
  }
}
