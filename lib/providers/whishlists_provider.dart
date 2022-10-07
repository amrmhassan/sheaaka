// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/constants/shared_pref_constants.dart';
import 'package:project/helpers/db_helper.dart';
import 'package:project/helpers/shared_pref_helper.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:project/models/wishlist_item_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:uuid/uuid.dart';

class WishListsProvider extends ChangeNotifier {
  List<WishListModel> wishLists = [];
  List<WishListItemModel> wishlistItems = [];

  String? _activeWishListId;

//? to get the acive wishlist id
  String? get activeWishListId {
    if (wishLists.isEmpty) {
      return null;
    } else if (_activeWishListId != null) {
      return _activeWishListId;
    } else {
      return wishLists.first.id;
    }
  }

  // // just for push test wishlist
  // void pushTestWishlists(List<WishListModel> w) {
  //   wishLists.addAll(w);
  //   notifyListeners();
  // }

//? fetch and update wishlists
  Future<void> fetchWishlistsAndWishlistsItems() async {
    wishLists.clear();
    wishlistItems.clear();
    //* for wishlists
    var data = await DBHelper.getData(wishlistsTableName);
    for (var wishlist in data) {
      wishLists.add(WishListModel.fromJSON(wishlist));
    }

    //* for wishlits items
    var items = await DBHelper.getData(wishlistItemsTableName);
    for (var item in items) {
      wishlistItems.add(WishListItemModel.fromJSON(item));
    }

    //* fetch active wishlist id
    String? activeID = await SharedPrefHelper.getString(activeWishlistIdKey);
    _activeWishListId = activeID;

    notifyListeners();
  }

//? for adding a new wishlist,
  Future<void> addWishList(String name) async {
    //* add it locally to provider
    String id = Uuid().v4();
    WishListModel w = WishListModel(
      id: id,
      name: name,
      createdAt: DateTime.now(),
    );
    wishLists.add(w);
    notifyListeners();

    //* add it to sqlite
    await DBHelper.insert(wishlistsTableName, w.toJSON());
  }

//? for setting the current active wishlist
//! add it to the shared prefs
  Future<void> setActiveWishList(String id) async {
    _activeWishListId = id;
    await SharedPrefHelper.setString(activeWishlistIdKey, id);
    notifyListeners();
  }

  //? for adding a new wishlist item
  Future<void> addWishlistItem(
      String productId, String wishListId, String note) async {
    //* add it to the provider
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();
    WishListItemModel wim = WishListItemModel(
      id: id,
      createdAt: createdAt,
      productId: productId,
      wishListId: wishListId,
      note: note,
    );
    wishlistItems.add(wim);
    notifyListeners();

    //* add it to sqlite
    await DBHelper.insert(wishlistItemsTableName, wim.toJSON());
  }

//? getWishlistItemByProductId
  WishListItemModel? getWishlistItemByProductId(String productId) {
    try {
      return wishlistItems
          .firstWhere((element) => element.productId == productId);
    } catch (e) {
      return null;
    }
  }

  //? get wishlistItems by wishlist Id
  List<ProductModel> getWishlistProducts(
    String wishlistId,
    ProductsProvider productsProvider,
  ) {
    List<ProductModel> wishlistProducts = [];
    List<WishListItemModel> wis = wishlistItems
        .where((element) => element.wishListId == wishlistId)
        .toList();
    for (var wishlistItem in wis) {
      ProductModel p = productsProvider.findProductById(wishlistItem.productId);
      wishlistProducts.add(p);
    }
    return wishlistProducts;
  }

  void removeWishlistItem(String wishlistItemId) {
    wishlistItems.removeWhere((element) => element.id == wishlistItemId);
    notifyListeners();
  }
}
