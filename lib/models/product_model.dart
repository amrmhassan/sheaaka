import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/string_to_type_utils.dart';

class ProductModel {
  String id;
  String name;
  String storeId;
  String storeName;
  String? storeLogo;
  List<String> imagesPath;
  int lovesNumber;
  double price;
  List<String>? keywords;
  BrandModel? brand;
  List<Sizes>? availableSize;
  List<Color>? availableColors;
  int? nOfComments;
  double? rating;
  int? remainingNumber;
  DateTime createdAt;
  String? fullDesc;
  String? shortDesc;
  String? offerId;
  String? categoryId;
  String? genderCategoryId;
  DateTime? offerEnd;
  DateTime? offerStarted;
  double? discount;

  ProductModel({
    required this.id,
    required this.name,
    required this.storeId,
    required this.storeName,
    required this.imagesPath,
    required this.createdAt,
    required this.lovesNumber,
    required this.price,
    this.storeLogo,
    this.keywords,
    this.brand,
    this.availableSize,
    this.nOfComments,
    this.rating,
    this.remainingNumber,
    this.offerId,
    this.fullDesc,
    this.shortDesc,
    this.availableColors,
    this.categoryId,
    this.genderCategoryId,
  });

  Map<String, dynamic> toJSON() {
    List<String>? sizesConverted = availableSize?.map((e) => e.name).toList();
    List<int>? colorsConverted = availableColors?.map((e) => e.value).toList();

    return {
      idString: id,
      nameString: name,
      storeIdString: storeId,
      storeLogoString: storeLogo,
      storeNameString: storeName,
      imagesPathString: imagesPath,
      createdAtString: createdAt,
      lovesNumberString: lovesNumber,
      priceString: price,
      brandString: brand?.toJSON(),
      availableSizeString: sizesConverted,
      nOfCommentsString: nOfComments,
      ratingString: rating,
      remainingNumberString: remainingNumber,
      fullDescString: fullDesc,
      shortDescString: shortDesc,
      availableColorsString: colorsConverted,
      keyWordsString: keywords,
      categoryIdString: categoryId,
      genderCategoryIdString: genderCategoryId,
      offerIdString: offerId,
    };
  }

//? to create a product model out of a json map
  static ProductModel fromJSON(Map<String, dynamic> productJSON) {
    String id = productJSON[idString];
    String name = productJSON[nameString];
    String storeId = productJSON[storeIdString];
    String? storeLogo = productJSON[storeLogoString];
    String storeName = productJSON[storeNameString];
    List<String> imagesPath = (productJSON[imagesPathString] as List<dynamic>)
        .map((e) => e.toString())
        .toList();
    DateTime createdAt = (productJSON[createdAtString] as Timestamp).toDate();
    int lovesNumber = productJSON[lovesNumberString];
    double price = double.parse((productJSON[priceString]).toString());
    BrandModel? brand = BrandModel.fromJSON(productJSON[brandString]);
    String? fullDesc = productJSON[fullDescString] as String?;
    String? shortDesc = productJSON[shortDescString] as String?;
    int? nOfComments = productJSON[nOfCommentsString] as int?;
    double? rating = productJSON[ratingString] as double?;
    int? remainingNumber = productJSON[remainingNumberString] as int?;
    List<Sizes>? availableSize =
        (productJSON[availableSizeString] as List<dynamic>?)
            ?.map((e) => stringToEnum(e, Sizes.values) as Sizes)
            .toList();
    List<Color>? availableColors =
        (productJSON[availableColorsString] as List<dynamic>?)
            ?.map((e) => intToColors(e))
            .toList();
    var keywordsHelper = productJSON[keyWordsString] as List<dynamic>?;

    List<String>? keywords = keywordsHelper == null
        ? keywordsHelper?.map((e) => e.toString()).toList()
        : (productJSON[keyWordsString] as List<dynamic>)
            .map((k) => k.toString())
            .toList();
    String? categoryId = productJSON[categoryIdString];
    String? genderCategoryId = productJSON[genderCategoryIdString];
    String? offerId = productJSON[offerIdString];
    return ProductModel(
      id: id,
      name: name,
      storeId: storeId,
      storeLogo: storeLogo,
      storeName: storeName,
      imagesPath: imagesPath,
      createdAt: createdAt,
      lovesNumber: lovesNumber,
      price: price,
      availableColors: availableColors,
      availableSize: availableSize,
      brand: brand,
      fullDesc: fullDesc,
      nOfComments: nOfComments,
      rating: rating,
      remainingNumber: remainingNumber,
      shortDesc: shortDesc,
      keywords: keywords,
      categoryId: categoryId,
      genderCategoryId: genderCategoryId,
      offerId: offerId,
    );
  }
}
