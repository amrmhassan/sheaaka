import 'package:flutter/material.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';

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
}
