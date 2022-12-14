import 'package:flutter/foundation.dart';
import 'package:project/constants/db_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/cart_item_model.dart';
import 'package:project/models/error_logger_model.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:project/models/wishlist_item_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database(String table) async {
    final databasePathDir = await sql.getDatabasesPath();

    String finalPath = path.join(databasePathDir, dbName);

    if (kDebugMode) {
      // await sql.deleteDatabase(finalPath);
      // await SharedPrefHelper.removeAllSavedKeys();
    }

    return sql.openDatabase(
      finalPath,
      //? this is when creating the database itself so create all your tables here
      onCreate: (db, version) async {
        //? creating error logger models table
        await db.execute(ErrorLoggerModel.toSqliteString());
        //? creating wishlist items table
        await db.execute(WishListItemModel.toSqliteString());
        //? creating wishlist  table
        await db.execute(WishListModel.toSqliteString());
        //? creating cart items table
        return db.execute(CartItemModel.toSqliteString());
      },
      version: 1,
    );
  }

  static Future<void> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    final db = await DBHelper.database(table);

    await db.insert(
      table,
      data,
      //? this line is for replacing the data if the id already exists
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database(table);
    return await db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getDataWhere(
      String table, String check, String profileId) async {
    final db = await DBHelper.database(table);
    return db.query(table, where: '$check = ?', whereArgs: [profileId]);
  }

  static Future<void> deleteDatabase(String dbName) async {
    final databasePathDir = await sql.getDatabasesPath();
    String finalPath = path.join(databasePathDir, dbName);
    return sql.deleteDatabase(finalPath);
  }

  static Future<void> deleteById(String id, String table) async {
    final db = await DBHelper.database(table);
    return db.execute("DELETE FROM $table WHERE $idString='$id'");
  }

  static Future<void> deleteTable(String table) async {
    final db = await DBHelper.database(table);
    return db.execute('DELETE FROM $table');
  }
}
