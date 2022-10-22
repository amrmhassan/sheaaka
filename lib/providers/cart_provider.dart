// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/helpers/db_helper.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/types.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems {
    return [..._cartItems];
  }

//? empty the whole cart
  void emptyAllCart() async {
    _cartItems.clear();
    await DBHelper.deleteTable(cartItemsTableName);
    notifyListeners();
  }

//? empty card
  void emptyCartFromSelectedItems(List<CartItemModel> selectedCartItems) async {
    for (var cartItem in selectedCartItems) {
      _cartItems.remove(cartItem);
      await DBHelper.deleteById(cartItem.id, cartItemsTableName);
    }
    notifyListeners();
  }

//? to add a cart item
  void addCartItem(
    String productId,
    Color? color,
    Sizes? size,
    String productName,
    String productImage,
    double productPrice,
  ) {
    //* add to the provider state
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();
    CartItemModel cartItemModel = CartItemModel(
      id: id,
      productId: productId,
      quantity: 1,
      createdAt: createdAt,
      color: color,
      size: size,
      productPrice: productPrice,
      productName: productName,
      productImage: productImage,
    );
    _cartItems.add(cartItemModel);

    //* save to sqlite
    DBHelper.insert(
      cartItemsTableName,
      cartItemModel.toJSON(),
    );

    notifyListeners();
  }

//? to increase the quantity of the cart item by 1
  void cartItemIncreaseQuantity(String cartItemId) {
    int index = _cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = _cartItems[index];
    c.quantity++;
    _cartItems[index] = c;
    notifyListeners();
  }

//? to decrease the quantity of the cart item by 1
  void cartItemDecreaseQuantity(String cartItemId) {
    int index = _cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = _cartItems[index];
    if (c.quantity <= 1) {
      return;
    }
    c.quantity--;
    _cartItems[index] = c;
    notifyListeners();
  }

//? toggle select cart item
  void toggleSelectCartItem(String cartItemId) {
    int index = _cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = _cartItems[index];
    c.selected = !c.selected;
    _cartItems[index] = c;
    notifyListeners();
  }

  //? delete cart item
  Future<void> deleteCartItem(String cartItemId) async {
    _cartItems.removeWhere((element) => element.id == cartItemId);
    await DBHelper.deleteById(cartItemId, cartItemsTableName);
    notifyListeners();
  }

  //? get the whole cart price(selected products only)
  double getCartPrice() {
    return _cartItems.where((element) => element.selected).fold(
        0,
        (previousValue, element) =>
            previousValue + element.productPrice * element.quantity);
  }

//? to get the selected cart items
  List<CartItemModel> get getSelectedCartItems {
    return _cartItems.where((element) => element.selected).toList();
  }

//? to check if a product is added to the cart
  bool productAddedToCart(String productId) {
    return _cartItems.indexWhere((element) => element.productId == productId) !=
        -1;
  }

  //? to fetch and update all cart items from the sqlite
  Future<void> fetchAndUpdateCartItems() async {
    _cartItems.clear();
    var data = await DBHelper.getData(cartItemsTableName);
    for (var cartItemMap in data) {
      _cartItems.add(CartItemModel.fromJSON(cartItemMap));
    }
    notifyListeners();
  }
}
