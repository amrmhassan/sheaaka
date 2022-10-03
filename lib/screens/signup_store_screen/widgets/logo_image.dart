// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/signup_store_screen/widgets/camera_image.dart';

class LogoImage extends StatelessWidget {
  final String? storeLogoPhoto;
  final bool logoLoading;

  const LogoImage({
    Key? key,
    required this.logoLoading,
    required this.storeLogoPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          padding:
              storeLogoPhoto == null ? EdgeInsets.all(largePadding * 2) : null,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
            border: Border.all(width: 1, color: kSecondaryColor),
            color: Colors.white,
          ),
          child: Opacity(
            opacity: storeLogoPhoto == null ? .2 : 1,
            child: storeLogoPhoto == null
                ? Image.asset(
                    'assets/icons/user.png',
                    color: kBlackColor,
                  )
                : Image.network(
                    storeLogoPhoto!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        if (storeLogoPhoto == null) CameraImage(),
        if (logoLoading) CircularProgressIndicator()
      ],
    );
  }
}
