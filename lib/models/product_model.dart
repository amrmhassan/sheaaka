import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/string_to_type_utils.dart';

class ProductModel {
  String id;
  String name;
  String storeId;
  String storeName;
  String storeLogo;
  int storeActiveOffers;
  List<String> imagesPath;
  int lovesNumber;
  double price;
  String? wishListId;

  BrandModel? brand;
  List<Sizes>? availableSize;
  List<Color>? availableColors;
  int? nOfComments;
  double? rating;
  double? oldPrice;
  int? remainingNumber;
  DateTime createdAt;
  String? fullDesc;
  String? shortDesc;
  bool? favorite;
  bool? hasOffer;
  DateTime? offerEnd;

  ProductModel({
    required this.id,
    required this.name,
    required this.storeId,
    required this.storeLogo,
    required this.storeName,
    required this.storeActiveOffers,
    required this.imagesPath,
    required this.createdAt,
    required this.lovesNumber,
    required this.price,
    this.wishListId,
    this.brand,
    this.availableSize,
    this.nOfComments,
    this.rating,
    this.oldPrice,
    this.remainingNumber,
    this.hasOffer,
    this.offerEnd,
    this.favorite,
    this.fullDesc,
    this.shortDesc,
    this.availableColors,
  });

//? to convert a product model to json
  Map<String, dynamic> toJSON() {
    List<String>? sizesConverted = availableSize?.map((e) => e.name).toList();
    List<int>? colorsConverted = availableColors?.map((e) => e.value).toList();
    return {
      idString: id,
      nameString: name,
      storeIdString: storeId,
      storeLogoString: storeLogo,
      storeNameString: storeName,
      storeActiveOffersString: storeActiveOffers,
      imagesPathString: imagesPath,
      createdAtString: createdAt,
      lovesNumberString: lovesNumber,
      priceString: price,
      wishListIdString: wishListId,
      brandString: brand?.toJSON(),
      availableSizeString: sizesConverted,
      nOfCommentsString: nOfComments,
      ratingString: rating,
      oldPriceString: oldPrice,
      remainingNumberString: remainingNumber,
      hasOfferString: hasOffer,
      offerEndString: offerEnd,
      favoriteString: favorite,
      fullDescString: fullDesc,
      shortDescString: shortDesc,
      availableColorsString: colorsConverted,
    };
  }

//? to create a product model out of a json map
  static ProductModel fromJSON(Map<String, dynamic> productDOC) {
    String id = productDOC[idString];
    String name = productDOC[nameString];
    String storeId = productDOC[storeIdString];
    String storeLogo = productDOC[storeLogoString];
    String storeName = productDOC[storeNameString];
    int storeActiveOffers = productDOC[storeActiveOffersString];
    List<String> imagesPath = (productDOC[imagesPathString] as List<dynamic>)
        .map((e) => e.toString())
        .toList();
    DateTime createdAt = (productDOC[createdAtString] as Timestamp).toDate();
    int lovesNumber = productDOC[lovesNumberString];
    double price = productDOC[priceString];
    String? wishListId = productDOC[wishListIdString] as String?;
    BrandModel? brand = BrandModel.fromJSON(productDOC[brandString]);

    double? oldPrice = productDOC[oldPriceString] as double?;
    bool? favorite = productDOC[favoriteString] as bool?;
    bool? hasOffer = productDOC[hasOfferString] as bool?;
    String? fullDesc = productDOC[fullDescString] as String?;
    String? shortDesc = productDOC[shortDescString] as String?;
    int? nOfComments = productDOC[nOfCommentsString] as int?;
    double? rating = productDOC[ratingString] as double?;
    int? remainingNumber = productDOC[remainingNumberString] as int?;
    DateTime? offerEnd = (productDOC[offerEndString] as Timestamp?)?.toDate();
    List<Sizes>? availableSize =
        (productDOC[availableSizeString] as List<dynamic>?)
            ?.map((e) => stringToSizes(e) as Sizes)
            .toList();
    List<Color>? availableColors =
        (productDOC[availableColorsString] as List<dynamic>?)
            ?.map((e) => intToColors(e))
            .toList();

    return ProductModel(
      id: id,
      name: name,
      storeId: storeId,
      storeLogo: storeLogo,
      storeName: storeName,
      storeActiveOffers: storeActiveOffers,
      imagesPath: imagesPath,
      createdAt: createdAt,
      lovesNumber: lovesNumber,
      price: price,
      wishListId: wishListId,
      availableColors: availableColors,
      availableSize: availableSize,
      brand: brand,
      favorite: favorite,
      fullDesc: fullDesc,
      hasOffer: hasOffer,
      nOfComments: nOfComments,
      offerEnd: offerEnd,
      oldPrice: oldPrice,
      rating: rating,
      remainingNumber: remainingNumber,
      shortDesc: shortDesc,
    );
  }
}
