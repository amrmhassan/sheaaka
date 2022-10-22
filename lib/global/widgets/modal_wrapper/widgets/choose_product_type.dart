// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/modal_wrapper/widgets/product_type_element.dart';
import 'package:project/screens/product_screen/widgets/product_props_choose.dart';

class ChooseProductType extends StatelessWidget {
  const ChooseProductType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductPropsChoose(
        title: 'النوع',
        child: Row(
          children: [
            ProductTypeElement(
              title: 'شبابي',
            ),
            ProductTypeElement(
              active: true,
              title: 'رجالي',
            ),
            ProductTypeElement(
              title: 'حريمي',
            ),
            ProductTypeElement(
              title: 'أطفالي',
            ),
          ],
        ));
  }
}
