// ignore_for_file: prefer_const_constructors

import 'package:project/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';

List<WishListModel> defaultWhishlists = [
  WishListModel(
    id: Uuid().v4(),
    name: 'تحويش البدلة',
    createdAt: DateTime.now(),
  ),
  WishListModel(
    id: Uuid().v4(),
    name: "فرح أخويا",
    createdAt: DateTime.now(),
  ),
  WishListModel(
    id: Uuid().v4(),
    name: 'شنط المدرسة',
    createdAt: DateTime.now(),
  ),
];
