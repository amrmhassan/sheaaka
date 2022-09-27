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
}
