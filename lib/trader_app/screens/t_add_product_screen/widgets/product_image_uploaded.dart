// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/offer_screen/show_single_image.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class ProductImageUploaded extends StatelessWidget {
  final File imageFile;

  final Function(File imageFile) removeImageFile;
  const ProductImageUploaded({
    Key? key,
    required this.imageFile,
    required this.removeImageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSnackBar(
            context: context,
            message: 'اضغط مطولا للحذف',
            snackBarType: SnackBarType.info);
      },
      onLongPress: () {
        removeImageFile(imageFile);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: kVPad),
            width: 180,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: kTraderSecondaryColor.withOpacity(.3),
              ),
            ),
            child: Image.file(
              imageFile,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned(
            right: largePadding,
            top: largePadding,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ShowSingleImage.routeName,
                  arguments: imageFile,
                );
              },
              child: Container(
                padding: EdgeInsets.all(largePadding),
                width: largeIconSize,
                height: largeIconSize,
                decoration: BoxDecoration(
                  color: kTraderPrimaryColor,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Image.asset(
                  'assets/icons/full-screen.png',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
