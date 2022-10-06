import 'package:flutter/animation.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/string_to_type_utils.dart';

class CartItemModel {
  String id;
  final String productId;
  final String productImage;
  final String productName;
  final double productPrice;
  final DateTime createdAt;
  final Sizes? size;
  final Color? color;
  bool selected;
  int quantity;

  CartItemModel({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    this.size,
    this.color,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.selected = true,
  });

  Map<String, String> toJSON() {
    return {
      idString: id,
      productIdString: productId,
      productImageString: productImage,
      productNameString: productName,
      productPriceString: productPrice.toString(),
      createdAtString: createdAt.toIso8601String(),
      sizeString: size?.name ?? dbNull,
      colorString: color == null ? dbNull : color!.value.toString(),
      quantityString: quantity.toString(),
    };
  }

  static CartItemModel fromJSON(Map<String, dynamic> cartJSON) {
    String id = cartJSON[idString]!;
    String productId = cartJSON[productIdString]!;
    int quantity = int.parse(cartJSON[quantityString]!);
    DateTime createdAt = DateTime.parse(cartJSON[createdAtString]!);
    String productImage = cartJSON[productImageString]!;
    String productName = cartJSON[productNameString]!;
    double productPrice = double.parse(cartJSON[productPriceString]!);
    Color? color = cartJSON[colorString] == dbNull
        ? null
        : Color(int.parse(cartJSON[colorString]!));
    Sizes? size = cartJSON[sizeString] == dbNull
        ? null
        : stringToEnum(cartJSON[sizeString]!, Sizes.values);

    return CartItemModel(
      id: id,
      productId: productId,
      quantity: quantity,
      createdAt: createdAt,
      productImage: productImage,
      productName: productName,
      productPrice: productPrice,
      color: color,
      size: size,
    );
  }

  static String toSqliteString() {
    // idString;
    // productIdString;
    // productImageString;
    // productNameString;
    // productPriceString;
    // createdAtString;
    // sizeString;
    // colorString;
    // quantityString;
    return 'CREATE TABLE $cartItemsTableName ($idString TEXT PRIMARY KEY,$productIdString TEXT,$productImageString TEXT,$productNameString TEXT,$productPriceString TEXT,$createdAtString TEXT,$sizeString TEXT,$colorString TEXT,$quantityString TEXT)';
  }
}
