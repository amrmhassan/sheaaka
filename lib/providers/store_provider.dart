// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/store_model.dart';

import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';

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

  //? for signing up a store
  Future<void> signUpStore({
    required String coverImagePath,
    required String? logoImagePath,
    required String name,
    required LatLng location,
  }) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw Exception('No user is logged in');
    }
    String id = Uuid().v4();

    StoreModel s = StoreModel(
      id: id,
      coverImagePath: coverImagePath,
      logoImagePath: logoImagePath,
      followers: 0,
      name: name,
      offers: [],
      location: location,
      creatorUserUID: currentUser.uid,
    );

    await FirebaseFirestore.instance
        .collection(storesCollectionName)
        .doc(id)
        .set(s.toJSON());
  }

  //# nearby stores
  List<StoreModel> _nearByStores = [];
  List<StoreModel> get nearByStores {
    return [..._nearByStores];
  }

  //? add distance to stores
  void addStoreDistanceAndSortThem(LocationData locationData) {
    LatLng latLng = locationFromLocationData(locationData);
    List<StoreModel> knownLocationStores =
        _stores.where((element) => element.location != null).toList();
    List<StoreModel> storesHelper = [];
    for (var s in knownLocationStores) {
      double distance = Geolocator.distanceBetween(
        s.location!.latitude,
        s.location!.longitude,
        latLng.latitude,
        latLng.longitude,
      );
      s.distance = distance;
      storesHelper.add(s);
    }
    storesHelper.sort(((a, b) => a.distance!.compareTo(b.distance!)));

    _nearByStores.clear();
    _nearByStores = storesHelper;
    notifyListeners();
  }
}
