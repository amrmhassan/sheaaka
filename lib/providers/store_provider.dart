// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/store_model.dart';

import 'package:project/utils/general_utils.dart';

class StoreProvider extends ChangeNotifier {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  bool loadingStores = false;

//# all stores
  List<StoreModel> _stores = [];

  List<StoreModel> get stores {
    return [..._stores];
  }

//? get store by id
  StoreModel getStoreById(String id) {
    return _stores.firstWhere((element) => element.id == id);
  }

//? fetch all stores from firebase
  Future<void> fetchStores([bool noStateNotify = false]) async {
    if (loadingStores) return;
    loadingStores = true;
    if (!noStateNotify) notifyListeners();
    QuerySnapshot<Map<String, dynamic>> res;
    res = await ref.collection(storesCollectionName).get();
    List<StoreModel> helperList = [];
    for (var element in res.docs) {
      var s = StoreModel.fromJSON(element.data());

      helperList.add(s);
    }
    _stores = helperList;
    loadingStores = false;

    notifyListeners();
  }

  //? add distance to stores
  void addStoreDistanceAndSortThem(LocationData locationData) {
    LatLng latLng = locationFromLocationData(locationData);
    List<StoreModel> storesHelper = [];
    for (var s in stores) {
      double distance = Geolocator.distanceBetween(
        s.location.latitude,
        s.location.longitude,
        latLng.latitude,
        latLng.longitude,
      );
      s.distance = distance;
      storesHelper.add(s);
    }
    storesHelper.sort(((a, b) => a.distance!.compareTo(b.distance!)));

    _stores.clear();
    _stores = storesHelper;
    notifyListeners();
  }
}
