import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/constants/models_constants.dart';

class AdsModel {
  final String id;
  final DateTime createdAt;
  final DateTime endDate;
  final String productName;
  final String imagePath;
  final String storeId;
  final String? storeLogo;
  final String storeName;

  const AdsModel({
    required this.id,
    required this.createdAt,
    required this.endDate,
    required this.imagePath,
    required this.productName,
    required this.storeId,
    required this.storeLogo,
    required this.storeName,
  });

  Map<String, dynamic> toJSON() {
    return {
      idString: id,
      createdAtString: createdAt,
      endDateString: endDate,
      imagePathString: imagePath,
      productNameString: productName,
      storeIdString: storeId,
      storeLogoString: storeLogo,
      storeNameString: storeName,
    };
  }

  static AdsModel fromJSON(Map<String, dynamic> adsJSON) {
    return AdsModel(
      id: adsJSON[idString],
      createdAt: (adsJSON[createdAtString] as Timestamp).toDate(),
      endDate: (adsJSON[endDateString] as Timestamp).toDate(),
      imagePath: adsJSON[imagePathString],
      productName: adsJSON[productNameString],
      storeId: adsJSON[storeIdString],
      storeLogo: adsJSON[storeLogoString],
      storeName: adsJSON[storeNameString],
    );
  }
}
