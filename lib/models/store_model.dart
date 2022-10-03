import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/key_word_model.dart';
import 'package:project/models/offer_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String? logoImagePath;
  final String coverImagePath;
  final int followers;
  final double? rating;

  List<KeyWordModel>? keywords;

  final String? desc;
  final List<OfferModel>? offers;
  final LatLng location;
  double? distance;
  String creatorUserUID;

  StoreModel({
    required this.id,
    required this.coverImagePath,
    this.logoImagePath,
    required this.followers,
    required this.name,
    required this.offers,
    required this.location,
    this.keywords,
    this.distance,
    this.desc,
    this.rating,
    required this.creatorUserUID,
  });

  Map<String, dynamic> toJSON() {
    List<Map<String, dynamic>>? offersJSON =
        offers?.map((e) => e.toJSON()).toList();
    GeoPoint locationPoint = GeoPoint(location.latitude, location.longitude);
    List<Map<String, dynamic>>? keywordsConverted =
        keywords?.map((e) => e.toJSON()).toList();
    return {
      idString: id,
      nameString: name,
      logoImagePathString: logoImagePath,
      coverImagePathString: coverImagePath,
      followersString: followers,
      ratingString: rating,
      descString: desc,
      offersString: offersJSON,
      locationString: locationPoint,
      keyWordsString: keywordsConverted,
      creatorUserUIDString: creatorUserUID,
    };
  }

  static StoreModel fromJSON(Map<String, dynamic> storeJSON) {
    String idF = storeJSON[idString];
    String coverImagePathF = storeJSON[coverImagePathString];
    String logoImagePathF = storeJSON[logoImagePathString];
    int followersF = storeJSON[followersString];
    String nameF = storeJSON[nameString];

    var offersHelper = storeJSON[offersString];

    List<dynamic>? offersF = offersHelper == null
        ? null
        : (storeJSON[offersString]).map((e) => OfferModel.fromJSON(e)).toList();

    GeoPoint locationGeoPoint = (storeJSON[locationString] as GeoPoint);
    LatLng locationF =
        LatLng(locationGeoPoint.latitude, locationGeoPoint.longitude);
    String? descF = storeJSON[descString];
    double? ratingF = storeJSON[ratingString];
    var keywordsHelper = storeJSON[keyWordsString];

    List<dynamic>? keywords = keywordsHelper == null
        ? keywordsHelper
        : (storeJSON[keyWordsString])
            .map((k) => KeyWordModel.fromJSON(k!))
            .toList();
    String creatorUserUID =
        storeJSON[creatorUserUIDString] ?? 'Jwqqj0UdfyRexLAQi4Tbieeiaej2';

    return StoreModel(
      id: idF,
      coverImagePath: coverImagePathF,
      logoImagePath: logoImagePathF,
      followers: followersF,
      name: nameF,
      offers: offersF == null ? null : [...offersF],
      location: locationF,
      desc: descF,
      rating: ratingF,
      keywords: keywords == null ? null : [...keywords],
      creatorUserUID: creatorUserUID,
    );
  }
}
