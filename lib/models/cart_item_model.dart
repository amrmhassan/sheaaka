import 'package:flutter/animation.dart';
import 'package:project/models/types.dart';

class CartItemModel {
  String id;
  final String productId;
  final String productImage;
  final String productName;
  final double productPrice;
  final DateTime createdAt;
  final Sizes size;
  final Color color;
  bool selected;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.size,
    required this.color,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.selected = true,
  });
}
