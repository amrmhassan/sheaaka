// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class NOfComments extends StatelessWidget {
  final int num;
  const NOfComments({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: h4TextStyleInactive,
        children: [
          TextSpan(
            text: num.toString(),
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: 'تعليقات',
          ),
        ],
      ),
    );
  }
}
