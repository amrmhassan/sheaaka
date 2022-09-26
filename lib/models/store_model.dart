import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/offer_model.dart';

class StoreModel {
  final String id;
  final String name;
  final String logoImagePath;
  final String coverImagePath;
  final int followers;
  final double? rating;
  final String? desc;
  final List<OfferModel> offers;
  final LatLng location;

  const StoreModel({
    required this.id,
    required this.coverImagePath,
    required this.logoImagePath,
    required this.followers,
    required this.name,
    required this.offers,
    required this.location,
    this.desc,
    this.rating,
  });

  Map<String, dynamic> toJSON() {
    List<Map<String, dynamic>> offersJSON =
        offers.map((e) => e.toJSON()).toList();
    GeoPoint locationPoint = GeoPoint(location.latitude, location.longitude);
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
    };
  }
}
