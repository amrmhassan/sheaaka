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

  const StoreModel({
    required this.id,
    required this.coverImagePath,
    required this.logoImagePath,
    required this.followers,
    required this.name,
    required this.offers,
    this.desc,
    this.rating,
  });
}
