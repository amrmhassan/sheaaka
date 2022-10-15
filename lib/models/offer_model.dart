import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/models_constants.dart';

class OfferModel {
  final String id;
  final String title;
  final String imagePath;
  final DateTime createdAt;
  final DateTime endAt;
  late bool active;
  final String productId;
  final String storeId;

  OfferModel({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.createdAt,
    required this.endAt,
    required this.productId,
    required this.storeId,
  }) {
    active = endAt.isAfter(DateTime.now());
  }

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      titleString: title,
      imagesPathString: imagePath,
      createdAtString: createdAt,
      endAtString: endAt,
      activeString: active,
      storeIdString: storeId,
      productIdString: productId,
    };
  }

  static OfferModel fromJSON(Map<String, dynamic> offerJSON) {
    return OfferModel(
      id: offerJSON[idString],
      imagePath: offerJSON[imagesPathString],
      title: offerJSON[titleString],
      createdAt: (offerJSON[createdAtString] as Timestamp).toDate(),
      endAt: (offerJSON[endAtString] as Timestamp).toDate(),
      productId: offerJSON[productIdString],
      storeId: offerJSON[storeIdString],
    );
  }
}
