// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';

class ProductPropsChoose extends StatelessWidget {
  final String title;
  final Widget child;
  const ProductPropsChoose({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: h2TextStyle,
        ),
        VSpace(factor: .5),
        child,
      ],
    );
  }
}
