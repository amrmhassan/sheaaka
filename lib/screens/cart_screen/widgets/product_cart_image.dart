// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ProductCartImage extends StatelessWidget {
  final VoidCallback? onTap;
  final String imagePath;
  const ProductCartImage({
    Key? key,
    this.onTap,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imagePath,
          width: 130,
          height: 130,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
        if (onTap != null)
          ButtonWrapper(
            onTap: onTap ?? () {},
            borderRadius: 0,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(largePadding * 4),
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
              ),
              child: Image.asset(
                'assets/icons/info.png',
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
