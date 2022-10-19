// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';

import 'package:project/utils/general_utils.dart';
import 'package:uuid/uuid.dart';

class StoreProvider extends ChangeNotifier {
  FirebaseFirestore ref = FirebaseFirestore.instance;
  bool loadingStores = false;

  //# all offers
  List<OfferModel> _offers = [];
  List<OfferModel> get offers {
    return [..._offers];
  }

//? get offer by id
  OfferModel findOfferById(String id) {
    return _offers.firstWhere((element) => element.id == id);
  }

//? delete offer
  Future<void> deleteOffer(String offerId) async {
    _offers.removeWhere((element) => element.id == offerId);
    try {
      notifyListeners();
    } catch (e, s) {
      CustomError(errString: e.toString(), stackTrace: s);
    }
    try {
      await FirebaseFirestore.instance
          .collection(offersCollectionName)
          .doc(offerId)
          .delete();
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorDeletingOffer,
        errString: e.toString(),
        stackTrace: s,
      );
    }
  }

  //? add offer
  Future<OfferModel> addOffer({
    required String imagePath,
    required String title,
    required DateTime endAt,
    required String productId,
    required String storeId,
    required double discountPercentage,
    required String productName,
    String? offerId,
  }) async {
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();

    OfferModel offerModel = OfferModel(
      id: offerId ?? id,
      imagePath: imagePath,
      title: title,
      createdAt: createdAt,
      endAt: endAt,
      productId: productId,
      storeId: storeId,
      discountPercentage: discountPercentage,
      productName: productName,
    );
    _offers.add(offerModel);
    try {
      notifyListeners();
    } catch (e) {
      //
    }
    try {
      await FirebaseFirestore.instance
          .collection(offersCollectionName)
          .doc(id)
          .set(offerModel.toJSON());
    } catch (e, s) {
      throw CustomError(
        errString: e.toString(),
        stackTrace: s,
        errorType: ErrorsTypes.errorCreatingOffer,
      );
    }
    return offerModel;
  }

//? fetch offers
  Future<void> fetchAndUpdateOffers([bool noStateNotify = false]) async {
    _offers.clear();
    var data = (await ref.collection(offersCollectionName).get()).docs;
    for (var o in data) {
      OfferModel offer = OfferModel.fromJSON(o.data());
      _offers.add(offer);
    }

    if (!noStateNotify) notifyListeners();
  }

//# all stores
  List<StoreModel> _stores = [];

  List<StoreModel> get stores {
    return [..._stores];
  }

//? get store by id
  StoreModel getStoreById(String id) {
    return _stores.firstWhere((element) => element.id == id);
  }

  //? get store by owner UID
  StoreModel getStoreByOwnerUID(String uid) {
    return _stores.firstWhere((element) => element.creatorUserUID == uid);
  }

//? fetch all stores from firebase
  Future<void> fetchStores([bool noStateNotify = false]) async {
    if (loadingStores) return;
    loadingStores = true;
    if (!noStateNotify) notifyListeners();

    try {
      QuerySnapshot<Map<String, dynamic>> res;
      res = await ref.collection(storesCollectionName).get();
      List<StoreModel> helperList = [];
      for (var element in res.docs) {
        var s = StoreModel.fromJSON(element.data());

        helperList.add(s);
        s.offers = _offers.where((element) => element.storeId == s.id).toList();
      }
      _stores = helperList;
      loadingStores = false;
      notifyListeners();
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLikedProducts,
        stackTrace: s,
        errString: e.toString(),
      );
    }
  }

  //? for signing up a store
  Future<void> signUpStore({
    required String coverImagePath,
    required String? logoImagePath,
    required String name,
    required LatLng? location,
    required List<String> phones,
    required List<String> emails,
  }) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw CustomError(
        errorType: ErrorsTypes.noUserLoggedIn,
        stackTrace: StackTrace.current,
      );
    }
    String id = Uuid().v4();

    StoreModel s = StoreModel(
      id: id,
      coverImagePath: coverImagePath,
      logoImagePath: logoImagePath,
      followers: 0,
      name: name,
      location: location ?? LatLng(30, 30),
      creatorUserUID: currentUser.uid,
      rating: 1,
      emails: emails,
      phones: phones,
    );
    try {
      await FirebaseFirestore.instance
          .collection(storesCollectionName)
          .doc(id)
          .set(s.toJSON());

      await FirebaseFirestore.instance
          .collection(usersCollectionName)
          .doc(s.creatorUserUID)
          .update({userRoleString: UserRole.trader.name});
    } catch (e, s) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLikedProducts,
        stackTrace: s,
      );
    }
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
