import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';

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
    storeModel.storeTabs = [
      ...storeModel.storeTabs.where((element) => element.allProducts),
      ...storeModel.storeTabs.where((element) => !element.allProducts),
    ];
    myStore = storeModel;
    if (notify) notifyListeners();
  }

  Future<void> addNewTab(String tabName) async {
    try {
      StoreTabModel storeTabModel =
          StoreTabModel(productsIds: [], title: tabName);
      //? adding a new tab
      await FirebaseFirestore.instance
          .collection(storesCollectionName)
          .doc(myStore!.id)
          .update({
        storeTabsString: [
          storeTabModel.toJSON(),
          ...myStore!.storeTabs.map((e) => e.toJSON())
        ]
      });

      myStore!.storeTabs = [
        ...myStore!.storeTabs.where((element) => element.allProducts),
        storeTabModel,
        ...myStore!.storeTabs.where((element) => !element.allProducts),
      ];
      notifyListeners();
    } catch (e, s) {
      throw CustomError(
        errString: e.toString(),
        errorType: ErrorsTypes.addingStoreTabError,
        stackTrace: s,
      );
    }
  }
}
