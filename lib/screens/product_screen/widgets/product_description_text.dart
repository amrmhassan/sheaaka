// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

const String exampleDescription =
    'وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا ';

class ProductDescriptionText extends StatelessWidget {
  const ProductDescriptionText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      exampleDescription,
      style: h4TextStyleInactive,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
