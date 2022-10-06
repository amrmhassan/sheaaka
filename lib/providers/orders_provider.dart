// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/order_model.dart';
import 'package:uuid/uuid.dart';

class OrdersProvider extends ChangeNotifier {
  final List<OrderModel> _orders = [];

  List<OrderModel> get orders {
    return [..._orders];
  }

  //? place an order
  Future<void> placeAnOrder(List<CartItemModel> cartItems) async {
    //* add it to provider
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();

    OrderModel o =
        OrderModel(id: id, cartItems: cartItems, createdAt: createdAt);
    _orders.add(o);
    //* add it to firebase
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('no user logged in');
      }
      await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(currentUser.uid)
          .collection(ordersCollectionName)
          .add(o.toJSON());
    } catch (e) {
      //* do error handling here
    }

    notifyListeners();
  }

  //? get user orders
  Future<void> fetchUpdateUserOrders() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    var data = await FirebaseFirestore.instance
        .collection(usersCollectionName)
        .doc(currentUser!.uid)
        .collection(ordersCollectionName)
        .get();

    for (var order in data.docs) {
      _orders.add(OrderModel.fromJSON(order.data()));
    }
    notifyListeners();
  }
}
