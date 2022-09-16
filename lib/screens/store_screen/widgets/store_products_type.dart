// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class StoreProductsType extends StatelessWidget {
  final Color? color;
  final String? title;
  const StoreProductsType({
    Key? key,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'لا يوجد وصف',
      style: h4TextStyleInactive.copyWith(
        color: color,
        height: 1,
      ),
    );
  }
}
