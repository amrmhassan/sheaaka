// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/types.dart';
import 'package:uuid/uuid.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> cartItems = [];

//? to add a cart item
  void addCartItem(
    String productId,
    Color color,
    Sizes size,
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
    cartItems.add(cartItemModel);
    notifyListeners();
  }

//? to increase the quantity of the cart item by 1
  void cartItemIncreaseQuantity(String cartItemId) {
    int index = cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = cartItems[index];
    c.quantity++;
    cartItems[index] = c;
    notifyListeners();
  }

//? to decrease the quantity of the cart item by 1
  void cartItemDecreaseQuantity(String cartItemId) {
    int index = cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = cartItems[index];
    if (c.quantity <= 1) {
      return;
    }
    c.quantity--;
    cartItems[index] = c;
    notifyListeners();
  }

//? toggle select cart item
  void toggleSelectCartItem(String cartItemId) {
    int index = cartItems.indexWhere((element) => element.id == cartItemId);
    CartItemModel c = cartItems[index];
    c.selected = !c.selected;
    cartItems[index] = c;
    notifyListeners();
  }

  //? delete cart item
  void deleteCartItem(String cartItemId) {
    cartItems.removeWhere((element) => element.id == cartItemId);
    notifyListeners();
  }

  //? get the whole cart price(selected products only)
  double getCartPrice() {
    return cartItems.where((element) => element.selected).fold(
        0,
        (previousValue, element) =>
            previousValue + element.productPrice * element.quantity);
  }

  List<CartItemModel> get getSelectedCartItems {
    return cartItems.where((element) => element.selected).toList();
  }

  bool productAddedToCart(String productId) {
    return cartItems.indexWhere((element) => element.productId == productId) !=
        -1;
  }
}
