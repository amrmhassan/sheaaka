// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/trader_app/constants/colors.dart';

class ProductImageUploaded extends StatelessWidget {
  final File imageFile;

  const ProductImageUploaded({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ),
    );
  }
}
