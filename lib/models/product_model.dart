import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/key_word_model.dart';
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
  List<KeyWordModel>? keywords;
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
  // bool? favorite;
  late bool hasOffer;
  DateTime? offerEnd;
  DateTime? offerStarted;
//  late String? offerId;
  //! i don't know if a product can be in multiple categories or not, so make sure then edit it to list if needed
  // CategoryModel? category;
  String? categoryId;
  String? genderCategoryId;

  ProductModel({
    required this.id,
    required this.name,
    required this.storeId,
    this.storeLogo,
    required this.storeName,
    required this.imagesPath,
    required this.createdAt,
    required this.lovesNumber,
    required this.price,
    this.keywords,
    this.brand,
    this.availableSize,
    this.nOfComments,
    this.rating,
    this.oldPrice,
    this.remainingNumber,
    // this.offerEnd,
    // this.offerStarted,
    // this.offerId,
    // this.favorite,
    this.fullDesc,
    this.shortDesc,
    this.availableColors,
    this.categoryId,
    this.genderCategoryId,
  }) {
    hasOffer = offerEnd != null && offerEnd!.isAfter(DateTime.now());
  }

//? to convert a product model to json
  Map<String, dynamic> toJSON() {
    List<String>? sizesConverted = availableSize?.map((e) => e.name).toList();
    List<int>? colorsConverted = availableColors?.map((e) => e.value).toList();
    List<Map<String, dynamic>>? keywordsConverted =
        keywords?.map((e) => e.toJSON()).toList();
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
      oldPriceString: oldPrice,
      remainingNumberString: remainingNumber,
      hasOfferString: hasOffer,
      offerEndString: offerEnd,
      offerStartedString: offerStarted,
      // favoriteString: favorite,
      fullDescString: fullDesc,
      shortDescString: shortDesc,
      availableColorsString: colorsConverted,
      keyWordsString: keywordsConverted,
      // categoryString: category?.toJSON(),
      categoryIdString: categoryId,
      genderCategoryIdString: genderCategoryId,
      // offerIdString: offerId,
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
    double price = productJSON[priceString];
    BrandModel? brand = BrandModel.fromJSON(productJSON[brandString]);

    double? oldPrice = productJSON[oldPriceString] as double?;
    // bool? favorite = productJSON[favoriteString] as bool?;
    String? fullDesc = productJSON[fullDescString] as String?;
    String? shortDesc = productJSON[shortDescString] as String?;
    int? nOfComments = productJSON[nOfCommentsString] as int?;
    double? rating = productJSON[ratingString] as double?;
    int? remainingNumber = productJSON[remainingNumberString] as int?;
    // DateTime? offerEnd = (productJSON[offerEndString] as Timestamp?)?.toDate();
    // DateTime? offerStarted =
    //     (productJSON[offerStartedString] as Timestamp?)?.toDate();
    List<Sizes>? availableSize =
        (productJSON[availableSizeString] as List<dynamic>?)
            ?.map((e) => stringToEnum(e, Sizes.values) as Sizes)
            .toList();
    List<Color>? availableColors =
        (productJSON[availableColorsString] as List<dynamic>?)
            ?.map((e) => intToColors(e))
            .toList();
    var keywordsHelper = productJSON[keyWordsString];

    List<dynamic>? keywords = keywordsHelper == null
        ? keywordsHelper
        : (productJSON[keyWordsString])
            .map((k) => KeyWordModel.fromJSON(k!))
            .toList();
    // var catHelper = productJSON[categoryString];

    // CategoryModel? category =
    //     catHelper == null ? catHelper : CategoryModel.fromJSON(catHelper);
    String? categoryId = productJSON[categoryIdString];
    String? genderCategoryId = productJSON[genderCategoryIdString];
    // String? offerId = productJSON[offerIdString];

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
      // favorite: favorite,
      fullDesc: fullDesc,
      nOfComments: nOfComments,
      // offerEnd: offerEnd,
      // offerStarted: offerStarted,
      oldPrice: oldPrice,
      rating: rating,
      remainingNumber: remainingNumber,
      shortDesc: shortDesc,
      keywords: keywords == null ? null : [...keywords],
      // category: category,
      categoryId: categoryId,
      genderCategoryId: genderCategoryId,
      // offerId: offerId,
    );
  }
}
