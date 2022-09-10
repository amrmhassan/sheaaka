import 'package:flutter/material.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';

class ProductModel {
  String id;
  String name;
  StoreModel store;
  List<String> imagesPath;
  int lovesNumber;
  double price;

  List<Sizes>? availableSize;
  List<Color>? availableColors;
  int? nOfComments;
  double? rating;
  double? oldPrice;
  int? remainingNumber;
  String? brand;
  DateTime createdAt;
  String? fullDesc;
  String? shortDesc;
  bool? favorite;
  bool? bookMark;
  bool? hasOffer;
  DateTime? offerEnd;

  ProductModel({
    required this.id,
    required this.name,
    required this.store,
    required this.imagesPath,
    required this.createdAt,
    required this.lovesNumber,
    required this.price,
    this.availableSize,
    this.nOfComments,
    this.rating,
    this.oldPrice,
    this.remainingNumber,
    this.brand,
    this.bookMark,
    this.hasOffer,
    this.offerEnd,
    this.favorite,
    this.fullDesc,
    this.shortDesc,
    this.availableColors,
  });
}
