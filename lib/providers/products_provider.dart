import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/customer_gender_model.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/categories_provider.dart';

int loadingAtATime = 10;

//? i will load all products in the back and load just 10 products to be viewed in the home
//? and when loading next home products i will check if the loading all product bool is false then i will load the next products from the all products list
//? else i will load them from the firebase

class ProductsProvider extends ChangeNotifier {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  // //# 1] All Products
  List<ProductModel> _allProducts = [];

  List<ProductModel> get allProducts {
    return [..._allProducts];
  }

  bool loadingAllProducts = false;
  void addProduct(ProductModel productModel) {
    _allProducts.add(productModel);
    notifyListeners();
  }

  // //? fetch all products
  Future<void> _fetchAllProducts(
    List<OfferModel> offers, [
    bool noStateNotify = false,
  ]) async {
    //! when fetching all products, fetch the offer data from offerIdString then add it to the product model,
    //! don't save the offer end date on the product, just fetch it

    if (loadingAllProducts) return;
    loadingAllProducts = true;
    if (!noStateNotify) notifyListeners();

    try {
      QuerySnapshot<Map<String, dynamic>> res;
      res = await ref
          .collection(productsCollectionName)
          .orderBy(createdAtString, descending: true)
          .get();

      List<ProductModel> helperList = [];
      for (var element in res.docs) {
        var p = ProductModel.fromJSON(element.data());
        try {
          OfferModel offer =
              offers.firstWhere((element) => element.productId == p.id);
          p.offerEnd = offer.endAt;
          p.offerStarted = offer.createdAt;
          p.hasOffer = true;
        } catch (e, s) {
          if (kDebugMode) {
            print('product has no offer');
          }
        }
        helperList.add(p);
      }
      _allProducts = helperList;
      loadingAllProducts = false;

      notifyListeners();
    } catch (e, stack) {
      throw CustomError(
        errorType: ErrorsTypes.errorLoadingProducts,
        stackTrace: stack,
        errString: e.toString(),
      );
    }
  }

  //# 2] HomeScreen Products
  List<ProductModel> _homeProducts = [];

  bool loadingHomeProducts = false;
  bool loadingNextHomeProducts = false;

//? to get the home products after applying its filters
  List<ProductModel> get homeProducts {
    if (onlyOffers) {
      return [..._allProducts.where((element) => element.hasOffer)];
    }
    return [..._homeProducts];
  }

  //? fetch and update home products
  //* this noStateNotify fixes a problem with the holder screen when trying to reload the home products
  Future<void> reloadHomeProducts(
    List<OfferModel> offers, [
    bool noStateNotify = false,
  ]) async {
    await _fetchAllProducts(offers, noStateNotify);

    if (loadingHomeProducts) return;

    loadingHomeProducts = true;
    if (!noStateNotify) notifyListeners();

    try {
      // QuerySnapshot<Map<String, dynamic>> res;
      // res = await ref
      //     .collection(productsCollectionName)
      //     .orderBy(createdAtString, descending: true)
      //     .limit(loadingAtATime)
      //     .get();

      // List<ProductModel> helperList = [];
      // for (var element in res.docs) {
      //   var p = ProductModel.fromJSON(element.data());
      //   helperList.add(p);
      // }
      // _homeProducts = helperList;
      _homeProducts = [..._allProducts];

      loadingHomeProducts = false;
      notifyListeners();
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorLoadingProducts,
        stackTrace: s,
      );
    }
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

      int lengthDiff = _allProducts.length - _homeProducts.length;
      int increaingAmount =
          ((loadingAtATime < lengthDiff) ? loadingAtATime : lengthDiff);
      int endIndex = startIndex + increaingAmount;

      List<ProductModel> nextProducts =
          _allProducts.sublist(startIndex, endIndex);
      _homeProducts.addAll(nextProducts);
      notifyListeners();
      return;
    }
    loadingNextHomeProducts = true;
    notifyListeners();
    try {
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
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorLoadingProducts,
        stackTrace: s,
      );
    }
  }

  //# 3] suggestions products
  final List<ProductModel> _suggestionsProducts = [];

  List<ProductModel> get suggestionsProducts {
    return [..._suggestionsProducts];
  }

  // ? fetch suggestions products depending on(Color)
  void fetchSuggestionProducts(String productId) {
    _suggestionsProducts.clear();
    List<ProductModel> helperList = [..._allProducts];
    ProductModel p = findProductById(productId);
    List<Color>? productColors = p.availableColors;
    if (productColors == null || productColors.isEmpty) {
      return;
    }

    for (var product in helperList) {
      if (product.id == productId ||
          product.availableColors == null ||
          product.availableColors!.isEmpty) {
        break;
      }
      for (var color in productColors) {
        if (product.availableColors!.contains(color)) {
          if (!_suggestionsProducts.contains(product)) {
            _suggestionsProducts.add(product);
          }
        }
      }
    }

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

//# user favorite products
  final List<String> _favoriteProductsIds = [];

  List<String> get favoriteProductsIds {
    return [..._favoriteProductsIds];
  }

//? checking if the product is favorite
  Future<bool> checkIfProductIsLiked(String productId) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw CustomError(
          errorType: ErrorsTypes.noUserLoggedIn,
          stackTrace: StackTrace.current);
    }
    try {
      var data = await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(currentUser.uid)
          .collection(usersLikesCollectionName)
          .doc(productId)
          .get();
      var res = data.data();
      if (res != null && res.values.first == true) {
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLikedProducts,
        stackTrace: s,
      );
    }
  }

//? getting liked products
  Future<void> fetchAndUpdateFavoriteProducts([bool notify = false]) async {
    _favoriteProductsIds.clear();
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw CustomError(errorType: ErrorsTypes.noUserLoggedIn);
    }
    try {
      var data = await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(currentUser.uid)
          .collection(usersLikesCollectionName)
          .get();

      for (var doc in data.docs) {
        var productId = doc.data().keys.first;
        var productLoved = doc.data().values.first;
        if (productLoved) {
          _favoriteProductsIds.add(productId);
        }
      }
      try {
        notifyListeners();
      } catch (e, s) {
        throw CustomError(
          errorType: ErrorsTypes.errorUpdatingState,
          stackTrace: s,
        );
      }
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLikedProducts,
        stackTrace: s,
      );
    }
  }

//? update product loves number in firebase
  Future<void> updateProductLovesNumber(String productId, bool loved) async {
    try {
      var productData = (await FirebaseFirestore.instance
              .collection(productsCollectionName)
              .doc(productId)
              .get())
          .data();
      int lovesNumber = productData![lovesNumberString];
      int newLovesNumber = loved ? lovesNumber - 1 : lovesNumber + 1;

      await FirebaseFirestore.instance
          .collection(productsCollectionName)
          .doc(productId)
          .update({lovesNumberString: newLovesNumber});
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLikedProducts,
        stackTrace: s,
      );
    }
  }

//? to toggle a product love
  Future<void> toggleFavProduct(String productId) async {
    //! here i will need to update the value of number of loves in the product itself
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw CustomError(errorType: ErrorsTypes.noUserLoggedIn);
    }
    ProductModel product =
        _homeProducts.firstWhere((element) => element.id == productId);

    //* updating in the local provider
    bool lovedLocally = _favoriteProductsIds.contains(productId);
    if (lovedLocally) {
      _favoriteProductsIds.remove(productId);
      product.lovesNumber = product.lovesNumber - 1;
    } else {
      _favoriteProductsIds.add(productId);
      product.lovesNumber = product.lovesNumber + 1;
    }
    notifyListeners();

//* updating in the firebase
    try {
      bool loved = await checkIfProductIsLiked(productId);

      await Future.wait([
//* add the product to the loved numbers
        FirebaseFirestore.instance
            .collection(usersCollectionName)
            .doc(currentUser.uid)
            .collection(usersLikesCollectionName)
            .doc(productId)
            .set({productId: !loved}),

        //* update product loved number
        updateProductLovesNumber(productId, loved),
      ]);
    } catch (e, s) {
      //* here i will reverse what just done in the first step
      if (lovedLocally) {
        _favoriteProductsIds.add(productId);
        product.lovesNumber = product.lovesNumber + 1;
      } else {
        _favoriteProductsIds.remove(productId);
        product.lovesNumber = product.lovesNumber - 1;
      }
      notifyListeners();
      throw CustomError(errorType: ErrorsTypes.loveError, stackTrace: s);
    }
  }

  //? get a product with id
  ProductModel findProductById(String id) {
    ProductModel p = _allProducts.firstWhere((element) => element.id == id);
    return p;
  }

//? getting store tab products
  List<ProductModel> getStoreTabProducts(
      StoreTabModel storeTabModel, String storeId) {
    return storeTabModel.productsIds.map((e) {
      ProductModel productModel = findProductById(e);
      return productModel;
    }).toList();
  }

  //? get store products
  List<ProductModel> getStoreProducts(String storeId) {
    List<ProductModel> storeProducts = [];

    storeProducts = _allProducts
        .where(
          (element) => element.storeId == storeId,
        )
        .toList();
    return storeProducts;
  }

  List<ProductModel> catProducts = [];
  //# categories products
  void setCategoriesProducts(
      {required CategoriesProvider catProvider, required bool notify}) {
    CustomerGenderModel gender = catProvider.activeGenderModel;
    String? categoryId = catProvider.activeCategoryId;
    dynamic color = catProvider.activeColor;
    Sizes? size = catProvider.activeSizeEnum;
    Iterable<ProductModel> helperList = [];
    //* gender id
    helperList =
        _allProducts.where((element) => element.genderCategoryId == gender.id);

    //* category id
    if (categoryId != null && categoryId != 'all') {
      helperList =
          helperList.where((element) => element.categoryId == categoryId);
    }
    //* color
    if (color != null && color != 'all') {
      helperList = helperList.where((element) =>
          element.availableColors != null &&
          element.availableColors!.contains(color));
    }
    //* sizes
    if (size != null && size != Sizes.allSizes) {
      helperList = helperList.where((element) =>
          element.availableSize != null &&
          element.availableSize!.contains(size));
    }

    catProducts = helperList.toList();
    if (notify) notifyListeners();
  }
}

// samsung a10s
