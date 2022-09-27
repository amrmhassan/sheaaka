// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/types.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems {
    return [..._cartItems];
  }

//? empty card
  void emptyCartFromSelectedItems(List<CartItemModel> selectedCartItems) {
    for (var cartItem in selectedCartItems) {
      _cartItems.remove(cartItem);
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
    print(cartItemModel.color);
    print(cartItemModel.size);
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
  void deleteCartItem(String cartItemId) {
    _cartItems.removeWhere((element) => element.id == cartItemId);
    notifyListeners();
  }

  //? get the whole cart price(selected products only)
  double getCartPrice() {
    return _cartItems.where((element) => element.selected).fold(
        0,
        (previousValue, element) =>
            previousValue + element.productPrice * element.quantity);
  }

  List<CartItemModel> get getSelectedCartItems {
    return _cartItems.where((element) => element.selected).toList();
  }

  bool productAddedToCart(String productId) {
    return _cartItems.indexWhere((element) => element.productId == productId) !=
        -1;
  }
}
