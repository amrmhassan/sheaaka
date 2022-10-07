import 'package:project/constants/db_constants.dart';
import 'package:project/constants/models_constants.dart';

class WishListItemModel {
  final String id;
  final String productId;
  final String wishListId;
  final String? note;
  final DateTime createdAt;

  const WishListItemModel({
    required this.id,
    required this.createdAt,
    required this.productId,
    required this.wishListId,
    this.note,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      productIdString: productId,
      wishListIdString: wishListId,
      noteString: note ?? dbNull,
      createdAtString: createdAt.toIso8601String(),
    };
  }

  static WishListItemModel fromJSON(Map<String, dynamic> itemJSON) {
    String id = itemJSON[idString];
    DateTime createdAt = DateTime.parse(itemJSON[createdAtString]);
    String productId = itemJSON[productIdString];
    String wishListId = itemJSON[wishListIdString];
    String? note = itemJSON[noteString] == dbNull ? null : itemJSON[noteString];

    return WishListItemModel(
      id: id,
      createdAt: createdAt,
      productId: productId,
      wishListId: wishListId,
      note: note,
    );
  }

  static String toSqliteString() {
    return 'CREATE TABLE $wishlistItemsTableName ($idString TEXT PRIMARY KEY,$productIdString TEXT,$wishListIdString TEXT,$noteString TEXT,$createdAtString TEXT)';
  }
}
