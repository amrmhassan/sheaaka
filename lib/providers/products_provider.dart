import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/product_model.dart';

int loadingAtATime = 10;

//? i will load all products in the back and load just 10 products to be viewed in the home
//? and when loading next home products i will check if the loading all product bool is false then i will load the next products from the all products list
//? else i will load them from the firebase

class ProductsProvider extends ChangeNotifier {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  // //# 1] All Products
  List<ProductModel> _allProducts = [];
  bool loadingAllProducts = false;

  // //? fetch all products
  Future<void> _fetchAllProducts([bool noStateNotify = false]) async {
    if (loadingAllProducts) return;
    loadingAllProducts = true;
    if (!noStateNotify) notifyListeners();

    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .orderBy(createdAtString, descending: true)
        .get();

    List<ProductModel> helperList = [];
    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      helperList.add(p);
    }
    _allProducts = helperList;
    loadingAllProducts = false;

    notifyListeners();
  }

  //# 2] HomeScreen Products
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
    _fetchAllProducts(noStateNotify);

    if (loadingHomeProducts) return;

    loadingHomeProducts = true;
    if (!noStateNotify) notifyListeners();

    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .orderBy(createdAtString, descending: true)
        .limit(loadingAtATime)
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
    if (_allProducts.isNotEmpty) {
      //* this will load the home products from the already loaded products if they exist
      ProductModel lastHomeProduct = _homeProducts.last;
      int startIndex = _allProducts
              .indexWhere((element) => element.id == lastHomeProduct.id) +
          1;
      int endIndex = startIndex + loadingAtATime;

      List<ProductModel> nextProducts =
          _allProducts.sublist(startIndex, endIndex);
      _homeProducts.addAll(nextProducts);
      notifyListeners();
      return;
    }
    loadingNextHomeProducts = true;
    notifyListeners();
    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .orderBy(createdAtString, descending: true)
        .limit(loadingAtATime)
        .startAfter([_homeProducts.last.createdAt]).get();

    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      _homeProducts.add(p);
    }

    loadingNextHomeProducts = false;
    notifyListeners();
  }

  //# 3] suggestions products
  List<ProductModel> _suggestionsProducts = [];

  //? fetch suggestions products depending on(Color)
  Future<void> fetchSuggestionProducts(int colorCode) async {
    var res = await ref
        .collection(productsCollectionName)
        .where(availableColorsString, arrayContains: [])
        .limit(20)
        .get();
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
  Future<ProductModel> findProductById(String id) async {
    int i = homeProducts.indexWhere((element) => element.id == id);
    if (i > 0) {
      return homeProducts[i];
    }
    var res = await ref.collection(productsCollectionName).doc(id).get();

    var p = ProductModel.fromJSON(res.data() as Map<String, dynamic>);

    return p;
  }

  //? to get the wishlist products
  List<ProductModel> getWhishListProducts(String wishListId) {
    return _homeProducts
        .where((element) => element.wishListId == wishListId)
        .toList();
  }

  //? get store products
  Future<List<ProductModel>> getStoreProducts(String storeId) async {
    List<ProductModel> storeProducts = [];
    if (_allProducts.isNotEmpty) {
      //* this will load the home products from the already loaded products if they exist

      storeProducts = _allProducts
          .where(
            (element) => element.storeId == storeId,
          )
          .toList();
      return storeProducts;
    }

    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref
        .collection(productsCollectionName)
        .where(storeIdString, isEqualTo: storeId)
        .get();

    for (var element in res.docs) {
      var p = ProductModel.fromJSON(element.data());
      storeProducts.add(p);
    }

    return storeProducts;
  }
}


// samsung a10s