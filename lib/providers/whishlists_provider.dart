// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/constants/fake_data/wishlists.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';

class WishListsProvider extends ChangeNotifier {
  List<WishListModel> wishLists = [...defaultWhishlists];
  String activeWishListId = defaultWhishlists[0].id;

//? for adding a new wishlist
  void addWishList(String name) {
    String id = Uuid().v4();
    WishListModel w = WishListModel(
      id: id,
      name: name,
      createdAt: DateTime.now(),
    );
    wishLists.add(w);
    print(wishLists.length);
    notifyListeners();
  }

//? for setting the current active wishlist
  void setActiveWishList(String id) {
    activeWishListId = id;
    notifyListeners();
  }
}
