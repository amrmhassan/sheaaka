// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/categories_screen/widgets/category_customer_type_container.dart';
import 'package:project/screens/categories_screen/widgets/category_items_grid.dart';
import 'package:project/screens/home_screen/widgets/open_search_box.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VSpace(),
        OpenSearchBox(),
        VSpace(),
        HLine(),
        VSpace(),
        CategoryCustomerTypeContainer(),
        VSpace(factor: 1.5),
        CategoryItemsGrid(),
      ],
    );
  }
}
