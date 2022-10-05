// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';

class AllColorsPalette extends StatelessWidget {
  final bool active;
  final VoidCallback onTap;

  const AllColorsPalette({
    Key? key,
    this.active = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: largeIconSize,
      height: largeIconSize,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallBorderRadius),
              ),
              child: Image.asset('assets/icons/palette.png'),
            ),
            if (active)
              Container(
                padding: EdgeInsets.all(mediumPadding),
                child: Image.asset(
                  'assets/icons/check-mark.png',
                  color: kPrimaryColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
