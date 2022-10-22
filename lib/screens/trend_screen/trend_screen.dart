// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/categories_screen/widgets/category_customer_type_container.dart';

//? this screen will have the trending products depending on the gender
//? and the best offers
//? it will has all sorts of products cards like Trending, best offers....

class TrendScreen extends StatefulWidget {
  static const String routeName = '/trend-screen';
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  //? user gender
  String activeGenderId = gendersConstants.first.id;
  void setActiveGender(String g) {
    setState(() {
      activeGenderId = g;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(factor: .5),
        HLine(),
        VSpace(),
        GroupHeader(
          title: 'الأنواع',
          subTitle: 'الكل',
          onTap: () {},
        ),
        CategoryCustomerTypeContainer(
          setActiveGender: setActiveGender,
          activeGenderId: activeGenderId,
        ),
        VSpace(),
        GroupHeader(
          title: 'الفئات',
          subTitle: 'الكل',
          onTap: () {},
        ),
      ],
    );
  }
}
