// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class ProductDescriptionText extends StatelessWidget {
  final String desc;
  const ProductDescriptionText({
    Key? key,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: h4TextStyleInactive,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
