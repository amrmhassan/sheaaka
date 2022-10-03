// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class TraderPhotoOnStorePost extends StatelessWidget {
  final String? logoPath;
  const TraderPhotoOnStorePost({
    Key? key,
    required this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return logoPath == null
        ? SizedBox()
        : Positioned(
            top: kVPad,
            right: kHPad,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  logoPath!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }
}
