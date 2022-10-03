// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class UploadCoverPhotoButton extends StatelessWidget {
  const UploadCoverPhotoButton({
    Key? key,
    required this.coverLoading,
    required this.showCoverImageModalHelper,
  }) : super(key: key);

  final bool coverLoading;
  final VoidCallback showCoverImageModalHelper;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: largePadding * 2,
      bottom: largePadding,
      child: GestureDetector(
        onTap: showCoverImageModalHelper,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: kHPad / 2, vertical: kVPad / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(smallBorderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!coverLoading)
                Image.asset(
                  'assets/icons/camera.png',
                  width: smallIconSize,
                ),
              HSpace(factor: .3),
              Text(
                'إضافة صورة',
                style: h4LiteTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
