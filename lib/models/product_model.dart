import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';

class ProductModel {
  final String name;
  final StoreModel store;
  final List<String> imagesPath;
  final int lovesNumber;
  final double price;
  final List<Sizes> availableSize;

  final int? nOfComments;
  final double? rating;
  final double? oldPrice;
  final int? remainingNumber;
  final String? brand;
  final DateTime createdAt;
  final String? fullDesc;
  final String? shortDesc;
  final bool? favorite;
  final bool? bookMark;
  final bool? hasOffer;
  final DateTime? offerEnd;

  const ProductModel({
    required this.name,
    required this.store,
    required this.imagesPath,
    required this.createdAt,
    required this.lovesNumber,
    required this.price,
    required this.availableSize,
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
  });
}
