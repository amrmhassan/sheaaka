// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/categories.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/categories_provider.dart';
import 'package:project/screens/categories_screen/widgets/category_customer_type_container.dart';
import 'package:project/screens/categories_screen/widgets/category_items_grid.dart';
import 'package:provider/provider.dart';

//? this screen will only have filters techniques like gender, clothes category
//? it won't have any product cards right now
//? you can see how to make filters from SheIn app
//! this screen will be a big filter, and it will be applied to all products

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  GlobalKey customKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var catProvider = Provider.of<CategoriesProvider>(context);
    var catProviderFalse =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Column(
      children: [
        // VSpace(),
        // OpenSearchBox(),
        VSpace(factor: .5),
        HLine(),
        VSpace(),
        // GroupHeader(
        //   title: 'الأنواع',
        //   subTitle: 'الكل',
        //   onTap: () {},
        // ),
        CategoryCustomerTypeContainer(
          setActiveGender: catProviderFalse.setActiveGenderId,
          activeGenderId: catProvider.activeGenderId,
        ),
        VSpace(),
        GroupHeader(
          title: 'الفئات',
          subTitle: 'إضافة',
          onTap: () {},
        ),
        CategoryItemsGrid(),
        VSpace(factor: .5),
        // PaddingWrapper(
        //   child: ButtonWrapper(
        //     backgroundColor: kPrimaryColor,
        //     padding:
        //         EdgeInsets.symmetric(horizontal: kHPad, vertical: kVPad / 2),
        //     onTap: () {},
        //     child: Text(
        //       'عرض',
        //       style: h3LiteTextStyle.copyWith(color: Colors.white),
        //     ),
        //   ),
        // ),
        VSpace(),
        // GroupHeader(onTap: () {}, subTitle: 'subTitle', title: 'title'),
        // Expanded(
        //   child: Container(
        //     padding: EdgeInsets.only(bottom: kVPad),
        //     child: Row(
        //       children: [
        //         HSpace(),
        //         AspectRatio(
        //           aspectRatio: 1,
        //           child: Container(
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(smallBorderRadius),
        //             ),
        //             child: Stack(
        //               children: [
        //                 Image.asset(
        //                   'assets/images/3.jpg',
        //                   height: 200,
        //                   fit: BoxFit.cover,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
