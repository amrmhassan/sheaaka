// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    Key? key,
    required this.coverLoading,
    required this.storeCoverPhoto,
  }) : super(key: key);

  final bool coverLoading;
  final String? storeCoverPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: kBlackColor),
      child: storeCoverPhoto == null
          ? Text(
              coverLoading ? '' : 'قم باختيار صورة غلاف',
              style: h3TextStyle.copyWith(color: kLightColor),
            )
          : Image.network(
              storeCoverPhoto!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}
