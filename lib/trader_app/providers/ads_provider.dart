// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/models/custom_error.dart';
import 'package:uuid/uuid.dart';

class AdsProvider extends ChangeNotifier {
  final List<AdsModel> _ads = [];
  List<AdsModel> get ads {
    return [..._ads];
  }

  //? add a new ads
  Future<void> createAds({
    required DateTime endDate,
    required String imagePath,
    required String productName,
    required String storeName,
    required String storeId,
    required String? storeLogo,
    required String productId,
  }) async {
    String id = Uuid().v4();
    DateTime createdAt = DateTime.now();

    AdsModel adsModel = AdsModel(
      id: id,
      createdAt: createdAt,
      endDate: endDate,
      imagePath: imagePath,
      productName: productName,
      productId: productId,
      storeId: storeId,
      storeLogo: storeLogo,
      storeName: storeName,
    );

    _ads.add(adsModel);
    notifyListeners();

    try {
      FirebaseFirestore.instance
          .collection(adsCollectionName)
          .doc(id)
          .set(adsModel.toJSON());
    } catch (e, s) {
      throw CustomError(
        errString: e.toString(),
        stackTrace: s,
        errorType: ErrorsTypes.errorCreatingAds,
      );
    }
  }

  //? fetch all ads
  Future<void> fetchAndUpdateAds([bool noStateNotify = false]) async {
    try {
      _ads.clear();
      var data =
          await FirebaseFirestore.instance.collection(adsCollectionName).get();
      for (var ads in data.docs) {
        _ads.add(AdsModel.fromJSON(ads.data()));
      }
      if (!noStateNotify) notifyListeners();
    } catch (e, s) {
      throw CustomError(
        errString: e.toString(),
        errorType: ErrorsTypes.errorLoadingAds,
        stackTrace: s,
      );
    }
  }
}
