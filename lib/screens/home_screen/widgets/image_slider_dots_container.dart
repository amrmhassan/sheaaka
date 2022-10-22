// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/screens/home_screen/widgets/image_slider_dot.dart';

class ImageSliderDotsContainer extends StatelessWidget {
  final int count;
  final int activeDot;

  const ImageSliderDotsContainer({
    Key? key,
    required this.count,
    required this.activeDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        count,
        (index) => ImageSliderDot(
          active: index == activeDot,
          last: index == count,
        ),
      ),
    );
  }
}
