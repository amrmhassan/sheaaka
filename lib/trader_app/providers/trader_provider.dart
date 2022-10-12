import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/store_model.dart';

class TraderProvider extends ChangeNotifier {
  StoreModel? myStore;

  Future<void> fetchMyStoreData([bool notify = true]) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    var data = await FirebaseFirestore.instance
        .collection(storesCollectionName)
        .where(creatorUserUIDString, isEqualTo: currentUser.uid)
        .get();
    StoreModel storeModel = StoreModel.fromJSON(data.docs.first.data());
    print(storeModel);
    myStore = storeModel;
    if (notify) notifyListeners();
  }
}
