// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class CameraImage extends StatelessWidget {
  const CameraImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(largePadding * 3),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.5),
        borderRadius: BorderRadius.circular(500),
      ),
      child: Image.asset(
        'assets/icons/camera.png',
        color: Colors.white,
      ),
    );
  }
}
