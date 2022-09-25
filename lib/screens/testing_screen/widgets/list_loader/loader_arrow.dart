// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class LoaderArrow extends StatelessWidget {
  final double opacity;
  final double radius;
  final double rotation;

  const LoaderArrow({
    Key? key,
    required this.radius,
    required this.opacity,
    required this.rotation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(rotation),
      origin: Offset(radius / 2, radius / 2),
      child: Container(
        padding: EdgeInsets.all(mediumPadding),
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 0),
              // spreadRadius: 15,
            ),
          ],
        ),
        child: Opacity(
          opacity: opacity,
          child: Image.asset(
            'assets/icons/loading.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
