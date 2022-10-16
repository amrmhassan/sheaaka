import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';

class TraderProvider extends ChangeNotifier {
  StoreModel? myStore;

//? getting current logged in user store data
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

//? adding a new tab to the store
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

  //? adding products to a tab
  Future<void> addProductsToTab(
    List<ProductModel> products,
    StoreTabModel activeStoreTab,
  ) async {
    try {
      //* merging products ids
      List<String> updatedIDs = [
        ...products.map((e) => e.id),
        ...activeStoreTab.productsIds
      ];

      await FirebaseFirestore.instance
          .collection(storesCollectionName)
          .doc(myStore!.id)
          .update({storeTabsString: updatedIDs}); //* gettings all store tabs
      List<StoreTabModel> tabs = myStore!.storeTabs;
      //* index of the active store tab
      int tabIndex = tabs.indexOf(activeStoreTab);
      tabs.remove(activeStoreTab);
      //* a new store tab with the new products ids
      StoreTabModel newStoreTab = StoreTabModel(
        productsIds: updatedIDs,
        title: activeStoreTab.title,
      );
      //* inserting it into the tabs
      tabs.insert(tabIndex, newStoreTab);
      //* updating the store tabs to be viewed
      myStore!.storeTabs = tabs;
      notifyListeners();
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorAddingProductsToTab,
        stackTrace: s,
        errString: e.toString(),
      );
    }
  }
}
