// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/search_screen/search_screen.dart';

class OpenSearchBox extends StatelessWidget {
  const OpenSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
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
