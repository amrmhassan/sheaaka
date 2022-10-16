import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/constants/stores_constants.dart';
import 'package:project/models/key_word_model.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/store_tab_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String? logoImagePath;
  final String coverImagePath;
  final int followers;
  final double? rating;
  List<StoreTabModel> storeTabs;
  final List<String> phones;
  final List<String> emails;

  List<KeyWordModel>? keywords;

  final String? desc;
  List<OfferModel>? offers;
  final LatLng? location;
  double? distance;
  String creatorUserUID;

  StoreModel({
    required this.id,
    required this.coverImagePath,
    required this.followers,
    required this.name,
    required this.creatorUserUID,
    required this.phones,
    required this.emails,
    this.logoImagePath,
    this.location,
    this.keywords,
    this.distance,
    this.desc,
    this.rating,
    this.storeTabs = defaultStoreTabs,
  });

  Map<String, dynamic> toJSON() {
    // List<Map<String, dynamic>>? offersJSON =
    //     offers?.map((e) => e.toJSON()).toList();

    GeoPoint? locationPoint = (location == null)
        ? null
        : GeoPoint(location!.latitude, location!.longitude);

    List<Map<String, dynamic>>? keywordsConverted =
        keywords?.map((e) => e.toJSON()).toList();

    List<Map<String, dynamic>> storeTabsJSON =
        storeTabs.map((e) => e.toJSON()).toList();

    return {
      idString: id,
      nameString: name,
      logoImagePathString: logoImagePath,
      coverImagePathString: coverImagePath,
      followersString: followers,
      ratingString: rating,
      descString: desc,
      // offersString: offersJSON,
      locationString: locationPoint,
      keyWordsString: keywordsConverted,
      creatorUserUIDString: creatorUserUID,
      storeTabsString: storeTabsJSON,
      emailsString: emails,
      phonesString: phones,
    };
  }

  static StoreModel fromJSON(Map<String, dynamic> storeJSON) {
    String idF = storeJSON[idString];
    String coverImagePathF = storeJSON[coverImagePathString];
    String? logoImagePathF = storeJSON[logoImagePathString];
    int followersF = storeJSON[followersString];
    String nameF = storeJSON[nameString];

    // var offersHelper = storeJSON[offersString];

    // List<dynamic>? offersF = offersHelper == null
    //     ? null
    //     : (storeJSON[offersString]).map((e) => OfferModel.fromJSON(e)).toList();

    GeoPoint? locationGeoPoint = (storeJSON[locationString] as GeoPoint?);
    LatLng? locationF = locationGeoPoint == null
        ? null
        : LatLng(locationGeoPoint.latitude, locationGeoPoint.longitude);
    String? descF = storeJSON[descString];
    double? ratingF = storeJSON[ratingString];
    var keywordsHelper = storeJSON[keyWordsString];

    List<dynamic>? keywords = keywordsHelper == null
        ? keywordsHelper
        : (storeJSON[keyWordsString])
            .map((k) => KeyWordModel.fromJSON(k!))
            .toList();
    String creatorUserUID =
        storeJSON[creatorUserUIDString] ?? 'qDjfg4sfaKOG2gY6Op6AdQiz5Ts1';

    var storeTabsHelper = storeJSON[storeTabsString] as List<dynamic>;
    List<StoreTabModel> storeTabs =
        (storeTabsHelper).map((e) => StoreTabModel.fromJSON(e)).toList();
    List<dynamic>? emailsHelper = storeJSON[emailsString];
    List<dynamic>? phonesHelper = storeJSON[phonesString];
    List<String> emails = emailsHelper?.map((e) => e.toString()).toList() ?? [];
    List<String> phones = phonesHelper?.map((e) => e.toString()).toList() ?? [];

    return StoreModel(
      id: idF,
      coverImagePath: coverImagePathF,
      logoImagePath: logoImagePathF,
      followers: followersF,
      name: nameF,
      // offers: offersF == null ? null : [...offersF],
      location: locationF,
      desc: descF,
      rating: ratingF,
      keywords: keywords == null ? null : [...keywords],
      creatorUserUID: creatorUserUID,
      storeTabs: storeTabs,
      emails: [...emails],
      phones: [...phones],
    );
  }
}
