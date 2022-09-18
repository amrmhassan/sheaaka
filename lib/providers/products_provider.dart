import 'package:flutter/material.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  void refresh() {
    products = [...dc.fProducts];
    notifyListeners();
  }

  List<ProductModel> products = [...dc.fProducts];

//? to get the home products after applying its filters
  List<ProductModel> get homeProducts {
    if (onlyOffers) {
      return products
          .where((element) =>
              element.offerEnd != null &&
              element.offerEnd!.isAfter(DateTime.now()))
          .toList();
    }
    return [...products];
  }

//@ only offers filter
  bool onlyOffers = false;
  void toggleOnlyOffers() {
    onlyOffers = !onlyOffers;
  }

  //@ applying filters
  void applyHomeFilters() {
    notifyListeners();
  }

//? to toggle a product love
  void toggleFavProduct(String id) {
    int index = products.indexWhere((element) => element.id == id);
    ProductModel product = products[index];
    products.removeAt(index);
    if (product.favorite == null || product.favorite == false) {
      product.favorite = true;
      product.lovesNumber += 1;
    } else {
      product.favorite = false;
      product.lovesNumber -= 1;
    }
    products.insert(index, product);
    notifyListeners();
  }

//? to toggle a pro
  void toggleWishListProduct(String id, [String? whishListId]) {
    int index = products.indexWhere((element) => element.id == id);
    ProductModel product = products[index];
    products.removeAt(index);
    if (product.wishListId == null) {
      product.wishListId = whishListId;
    } else {
      product.wishListId = null;
    }
    products.insert(index, product);

    notifyListeners();
  }

  //? get a product with id
  ProductModel findProductById(String id) {
    return products.firstWhere((element) => id == element.id);
  }

  //? to get the wishlist products
  List<ProductModel> getWhishListProducts(String wishListId) {
    return products
        .where((element) => element.wishListId == wishListId)
        .toList();
  }

  //? get store products
  List<ProductModel> getStoreProducts(String storeId) {
    return products.where((element) => element.store.id == storeId).toList();
  }
}
