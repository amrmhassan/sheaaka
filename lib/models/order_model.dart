import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final List<CartItemModel> cartItems;
  final DateTime createdAt;
  late double fullPrice;

  OrderModel({
    required this.id,
    required this.cartItems,
    required this.createdAt,
  }) {
    fullPrice = cartItems.fold(
      0,
      (previousValue, element) =>
          previousValue + element.productPrice * element.quantity,
    );
  }

  Map<String, dynamic> toJSON() {
    List<Map<String, dynamic>> cartItemsConverted =
        cartItems.map((e) => e.toJSON()).toList();
    return {
      idString: id,
      cartItemsString: cartItemsConverted,
      createdAtString: createdAt,
    };
  }

  static OrderModel fromJSON(Map<String, dynamic> orderJSON) {
    String id = orderJSON[idString];
    List<CartItemModel> cartItems =
        (orderJSON[cartItemsString] as List<dynamic>)
            .map((e) => CartItemModel.fromJSON(e))
            .toList();
    DateTime createdAt = (orderJSON[createdAtString] as Timestamp).toDate();

    return OrderModel(
      id: id,
      cartItems: cartItems,
      createdAt: createdAt,
    );
  }
}
