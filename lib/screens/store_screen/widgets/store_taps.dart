// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/screens/store_screen/widgets/store_category_element.dart';

class StoreTaps extends StatelessWidget {
  const StoreTaps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kVPad * 2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: storeTitleHSpace),
            StoreCategoryElement(active: true, title: 'الكل'),
            StoreCategoryElement(title: 'الأشهر'),
            StoreCategoryElement(title: 'الأفضل'),
            SizedBox(width: storeTitleHSpace),
          ],
        ),
      ),
    );
  }
}
