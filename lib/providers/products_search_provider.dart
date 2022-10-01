import 'package:flutter/cupertino.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';

class SearchProvider extends ChangeNotifier {
  List<ProductModel> _searchProducts = [];
  List<ProductModel> get searchProducts {
    return [..._searchProducts];
  }

  String? noSearchResults;

  void applySearchProducts(
      String searchQuery, ProductsProvider productsProvider) {
    var allProducts = productsProvider.allProducts;

    try {
      _searchProducts = [
        ...allProducts.where(
          (element) =>
              element.name.contains(searchQuery) ||
              (element.fullDesc ?? '').contains(searchQuery) ||
              (element.shortDesc ?? '').contains(searchQuery),
        )
      ];
      noSearchResults = null;
    } catch (e) {
      noSearchResults = 'No Search Results Found';
      _searchProducts = [];
    }
    notifyListeners();
  }

  //# search stores
  List<StoreModel> _searchStores = [];
  List<StoreModel> get searchStores {
    return [..._searchStores];
  }

  void applySearchStores(String searchQuery, StoreProvider storeProvider) {
    var stores = storeProvider.stores;
    try {
      _searchStores = [
        ...stores.where((element) =>
            element.name.contains(searchQuery) ||
            (element.desc ?? '').contains(searchQuery))
      ];
      noSearchResults = null;
    } catch (e) {
      noSearchResults = 'No Search Results Found';
      _searchStores = [];
    }
    notifyListeners();
  }
}
