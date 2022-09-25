// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishListsProvider extends ChangeNotifier {
  List<WishListModel> wishLists = [];
  // List<WishListItemModel> wishlistItems = [];

  String? activeWishListId;

//? for adding a new wishlist
  void addWishList(String name) {
    String id = Uuid().v4();
    WishListModel w = WishListModel(
      id: id,
      name: name,
      createdAt: DateTime.now(),
    );
    wishLists.add(w);
    notifyListeners();
  }

//? for setting the current active wishlist
  void setActiveWishList(String id) {
    activeWishListId = id;
    notifyListeners();
  }

  // // for adding a new wishlist item
  // void addWishlistItem(String productId, String wishListId) {
  //   String id = Uuid().v4();
  //   DateTime createdAt = DateTime.now();
  //   wishlistItems.add(
  //     WishListItemModel(
  //       id: id,
  //       createdAt: createdAt,
  //       productId: productId,
  //       wishListId: wishListId,
  //     ),
  //   );
  //   notifyListeners();
  // }
}
