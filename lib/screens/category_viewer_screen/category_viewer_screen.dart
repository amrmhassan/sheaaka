// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/categories_provider.dart';
import 'package:provider/provider.dart';

class CategoryViewerScreen extends StatelessWidget {
  const CategoryViewerScreen({Key? key}) : super(key: key);
  static const String routeName = '/category-viewer-screen';

  @override
  Widget build(BuildContext context) {
    var catProvider = Provider.of<CategoriesProvider>(context);
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(title: catProvider.activeGenderModel.title),
          VSpace(),
          Text(catProvider.activeGenderModel.title),
          Text(catProvider.activeCategoryModel!.title),
        ],
      ),
    );
  }
}
