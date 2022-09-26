// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/store_model.dart';

//! see the last item in timeline

class StoreProvider extends ChangeNotifier {
  FirebaseFirestore ref = FirebaseFirestore.instance;

  List<StoreModel> _stores = [];
  bool loadingStores = false;
  List<StoreModel> get stores {
    return [..._stores];
  }

  StoreModel getStoreById(String id) {
    return _stores.firstWhere((element) => element.id == id);
  }

  Future<void> fetchStores([bool noStateNotify = false]) async {
    if (loadingStores) return;
    loadingStores = true;
    if (!noStateNotify) notifyListeners();

    QuerySnapshot<Map<String, dynamic>> res;
    //! add orderby the location
    res = await ref.collection(storesCollectionName).get();

    List<StoreModel> helperList = [];
    for (var element in res.docs) {
      var p = StoreModel.fromJSON(element.data());
      helperList.add(p);
    }
    _stores = helperList;
    loadingStores = false;

    notifyListeners();
  }
}
