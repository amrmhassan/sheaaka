// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/genders_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/categories_screen/widgets/category_customer_type.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class CategoryCustomerTypeContainer extends StatelessWidget {
  final String activeGenderId;
  final Function(String g) setActiveGender;

  const CategoryCustomerTypeContainer({
    Key? key,
    required this.activeGenderId,
    required this.setActiveGender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.symmetric(horizontal: kHPad * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...gendersConstants.map(
            (gender) {
              bool active = gender.id == activeGenderId;
              return CategoryCustomerType(
                onTap: () => setActiveGender(gender.id),
                title: gender.title,
                active: active,
              );
            },
          )
        ],
      ),
    );
  }
}
