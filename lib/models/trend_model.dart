import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/models_constants.dart';

class TrendModel {
  final String id;
  final String productId;
  final DateTime createdAt;
  final DateTime endAt;

  const TrendModel({
    required this.createdAt,
    required this.endAt,
    required this.id,
    required this.productId,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      productIdString: productId,
      createdAtString: createdAt,
      endAtString: endAt,
    };
  }

  static TrendModel fromJSON(Map<String, dynamic> trendJSON) {
    return TrendModel(
      createdAt: (trendJSON[createdAtString] as Timestamp).toDate(),
      endAt: (trendJSON[endAtString] as Timestamp).toDate(),
      id: trendJSON[idString],
      productId: trendJSON[productIdString],
    );
  }
}
