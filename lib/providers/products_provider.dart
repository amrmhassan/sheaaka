import 'package:flutter/material.dart';
import 'package:project/constants/fake_data/products.dart';
import 'package:project/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> products = [...allProducts];

//? to toggle a product love
  void toggleFavProduct(String id) {
    int index = products.indexWhere((element) => element.id == id);
    ProductModel product = products[index];
    products.removeAt(index);
    if (product.favorite == null || product.favorite == false) {
      product.favorite = true;
    } else {
      product.favorite = false;
    }
    products.insert(index, product);
    notifyListeners();
  }

//? to toggle a pro
  void toggleWishListProduct(String id) {
    int index = products.indexWhere((element) => element.id == id);
    ProductModel product = products[index];
    products.removeAt(index);
    if (product.bookMark == null || product.bookMark == false) {
      product.bookMark = true;
    } else {
      product.bookMark = false;
    }
    products.insert(index, product);
    notifyListeners();
  }

  //? get a product with id
  ProductModel findProductById(String id) {
    return products.firstWhere((element) => id == element.id);
  }

  //? to get the wishlist products
  List<ProductModel> getWhishListProducts() {
    return products.where((element) => element.bookMark == true).toList();
  }
}
