// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class ImageSliderDot extends StatelessWidget {
  final bool active;
  final bool last;

  const ImageSliderDot({
    Key? key,
    this.active = false,
    this.last = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: last ? null : EdgeInsets.only(left: smallPadding / 2),
      width: last ? 5 : 6,
      height: last ? 5 : 6,
      decoration: BoxDecoration(
        color: active ? kPrimaryColor : null,
        borderRadius: BorderRadius.circular(500),
        border: active ? null : Border.all(width: 1, color: kSecondaryColor),
      ),
    );
  }
}
