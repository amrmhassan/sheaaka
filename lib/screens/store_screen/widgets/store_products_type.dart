// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class StoreProductsType extends StatelessWidget {
  const StoreProductsType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'محل ملابس رياضية',
      style: h4TextStyleInactive,
    );
  }
}
