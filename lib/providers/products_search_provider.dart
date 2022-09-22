import 'package:flutter/cupertino.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';

class ProductsSearchProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<StoreModel> stores = [];
  String? noSearchResults;

  void applySearchProducts(String searchQuery) {
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

  void applySearchStores(String searchQuery) {
    try {
      stores = [
        ...dc.fStores.where((element) =>
            element.name.contains(searchQuery) ||
            (element.desc ?? '').contains(searchQuery))
      ];
      noSearchResults = null;
    } catch (e) {
      noSearchResults = 'No Search Results Found';
      stores = [];
    }
    notifyListeners();
  }
}
