import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  void refresh() {
    // products = [...dc.fProducts];
    notifyListeners();
  }

  // List<ProductModel> products = [...dc.fProducts];
  //# HomeScreen Products
  FirebaseFirestore ref = FirebaseFirestore.instance;
  List<ProductModel> _homeProducts = [];
  bool loadingHomeProducts = false;
  bool loadingNextHomeProducts = false;

//? to get the home products after applying its filters
  List<ProductModel> get homeProducts {
    return [..._homeProducts];
  }

  //? fetch and update home products
  //* this noStateNotify fixes a problem with the holder screen when trying to reload the home products
  Future<void> reloadHomeProducts([bool noStateNotify = false]) async {
    if (loadingHomeProducts) return;
    loadingHomeProducts = true;
    if (!noStateNotify) notifyListeners();

    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .orderBy(createdAtString, descending: true)
        .limit(10)
        .get();

    List<ProductModel> helperList = [];
    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      helperList.add(p);
    }
    _homeProducts = helperList;
    loadingHomeProducts = false;
    notifyListeners();
  }

  //? loading the next 10 products
  Future<void> getNextHomeProducts() async {
    if (loadingNextHomeProducts) return;
    loadingNextHomeProducts = true;
    notifyListeners();
    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .orderBy(createdAtString, descending: true)
        .limit(10)
        .startAfter([_homeProducts.last.createdAt]).get();

    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      _homeProducts.add(p);
    }

    loadingNextHomeProducts = false;
    notifyListeners();
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
    int index = _homeProducts.indexWhere((element) => element.id == id);
    ProductModel product = _homeProducts[index];
    _homeProducts.removeAt(index);
    if (product.favorite == null || product.favorite == false) {
      product.favorite = true;
      product.lovesNumber += 1;
    } else {
      product.favorite = false;
      product.lovesNumber -= 1;
    }
    _homeProducts.insert(index, product);
    notifyListeners();
  }

//? to toggle a pro
  void toggleWishListProduct(String id, [String? whishListId]) {
    int index = _homeProducts.indexWhere((element) => element.id == id);
    ProductModel product = _homeProducts[index];
    _homeProducts.removeAt(index);
    if (product.wishListId == null) {
      product.wishListId = whishListId;
    } else {
      product.wishListId = null;
    }
    _homeProducts.insert(index, product);

    notifyListeners();
  }

  //? get a product with id
  ProductModel findProductById(String id) {
    return _homeProducts.firstWhere((element) => id == element.id);
  }

  //? to get the wishlist products
  List<ProductModel> getWhishListProducts(String wishListId) {
    return _homeProducts
        .where((element) => element.wishListId == wishListId)
        .toList();
  }

  //? get store products
  List<ProductModel> getStoreProducts(String storeId) {
    return _homeProducts
        .where((element) => element.storeId == storeId)
        .toList();
  }
}
