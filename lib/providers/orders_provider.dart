// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/order_model.dart';
import 'package:uuid/uuid.dart';

class OrdersProvider extends ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders {
    return [..._orders];
  }

  //? place an order
  void placeAnOrder(List<CartItemModel> cartItems) {
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();

    OrderModel o =
        OrderModel(id: id, cartItems: cartItems, createdAt: createdAt);
    _orders.add(o);
    notifyListeners();
  }
}
