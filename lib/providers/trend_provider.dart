// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/trend_model.dart';
import 'package:uuid/uuid.dart';

class TrendProvider extends ChangeNotifier {
  final List<TrendModel> _trends = [];
  List<TrendModel> get trend {
    return [..._trends];
  }

  //? add a new trend
  Future<void> addNewTrend({
    required DateTime endAt,
    required String productId,
  }) async {
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();
    TrendModel trendModel = TrendModel(
      createdAt: createdAt,
      endAt: endAt,
      id: id,
      productId: productId,
    );

    await FirebaseFirestore.instance
        .collection(trendsCollectionName)
        .doc(id)
        .set(trendModel.toJSON());

    _trends.add(trendModel);
    notifyListeners();
  }
}
