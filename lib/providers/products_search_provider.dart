import 'package:flutter/cupertino.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';

class ProductsSearchProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  String? noSearchResults;

  void applySearch(String searchQuery) {
    try {
      products = [
        ...dc.fProducts.where(
          (element) =>
              element.name.contains(searchQuery) ||
              (element.fullDesc ?? '').contains(searchQuery) ||
              (element.shortDesc ?? '').contains(searchQuery),
        )
      ];
      noSearchResults = null;
    } catch (e) {
      noSearchResults = 'No Search Results Found';
      products = [];
    }
    notifyListeners();
  }
}
