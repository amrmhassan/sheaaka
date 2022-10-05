//? updating the products when data changed
import 'package:flutter/material.dart';
import 'package:project/providers/categories_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:provider/provider.dart';

void updateCategories(BuildContext context, [bool notifyListers = true]) {
  var productsProviderFalse =
      Provider.of<ProductsProvider>(context, listen: false);
  var catProvider = Provider.of<CategoriesProvider>(context, listen: false);
  productsProviderFalse.setCategoriesProducts(
    catProvider: catProvider,
    notify: notifyListers,
  );
}
