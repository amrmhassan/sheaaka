// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/store_screen/store_screen.dart';

class StoreLogoPhotoStorePage extends StatelessWidget {
  final String? imagePath;
  const StoreLogoPhotoStorePage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -storeLogoRadius / 2,
      right: kHPad / 2,
      child: Container(
        padding: imagePath == null ? EdgeInsets.all(largePadding) : null,
        height: storeLogoRadius,
        width: storeLogoRadius,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(500),
          border: Border.all(
            width: .5,
            style: BorderStyle.solid,
            color: kPrimaryColor,
          ),
        ),
        //* this container is just to fix the border issue
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
          ),
          child: imagePath == null
              ? Image.asset(
                  'assets/icons/user.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  color: kSecondaryColor,
                )
              : FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage(
                    imagePath!,
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
        ),
      ),
    );
  }
}
