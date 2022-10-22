// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';

class OpenSearchBox extends StatelessWidget {
  final VoidCallback onTap;
  const OpenSearchBox({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kHPad * 2),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
          border: Border.all(
            width: 2,
            color: kSecondaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(largePadding),
              child: Image.asset(
                'assets/icons/search.png',
                color: kSecondaryColor,
              ),
            ),
            Text(
              'بحث',
              style: h4TextStyleInactive,
            )
          ],
        ),
      ),
    );
  }
}
