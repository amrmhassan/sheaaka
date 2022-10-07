import 'package:project/constants/db_constants.dart';
import 'package:project/constants/models_constants.dart';

class WishListModel {
  final String id;
  final String name;
  final DateTime createdAt;

  const WishListModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  Map<String, String> toJSON() {
    return {
      idString: id,
      nameString: name,
      createdAtString: createdAt.toIso8601String(),
    };
  }

  static WishListModel fromJSON(Map<String, dynamic> wishlistJSON) {
    String id = wishlistJSON[idString];
    String name = wishlistJSON[nameString];
    DateTime createdAt =
        DateTime.parse(wishlistJSON[createdAtString] as String);
    return WishListModel(
      id: id,
      name: name,
      createdAt: createdAt,
    );
  }

  static String toSqliteString() {
    return 'CREATE TABLE $wishlistsTableName ($idString TEXT PRIMARY KEY, $nameString TEXT, $createdAtString TEXT)';
  }
}
