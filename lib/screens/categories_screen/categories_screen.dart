// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/categories_screen/widgets/category_customer_type_container.dart';
import 'package:project/screens/categories_screen/widgets/category_items_grid.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  GlobalKey customKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // VSpace(),
        // OpenSearchBox(),
        VSpace(factor: .5),
        HLine(),
        VSpace(),
        GroupHeader(
          title: 'الفئات',
          subTitle: 'الكل',
          onTap: () {},
        ),
        VSpace(factor: .5),
        CategoryCustomerTypeContainer(),
        VSpace(factor: 1.5),
        CategoryItemsGrid(),
        VSpace(factor: .5),
        GroupHeader(onTap: () {}, subTitle: 'subTitle', title: 'title'),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(bottom: kVPad),
            child: Row(
              children: [
                HSpace(),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(smallBorderRadius),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
