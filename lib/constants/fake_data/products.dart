// ignore_for_file: prefer_const_constructors

import 'package:project/constants/fake_data/brands_constants.dart';
import 'package:project/constants/fake_data/stores.dart';
import 'package:project/constants/fake_data/wishlists.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:uuid/uuid.dart';

List<ProductModel> allProducts = [
//? product 1
  ProductModel(
    id: Uuid().v4(),
    name: 'منتج أول',
    price: 144.5,
    oldPrice: 200,
    lovesNumber: 10,
    rating: 4.5,
    availableSize: [
      Sizes.s,
      Sizes.m,
      Sizes.l,
    ],
    availableColors: productColors,
    fullDesc:
        'وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا ',
    shortDesc: 'قميص ابيض فاتح جميل اوي',
    store: stores[0],
    imagesPath: [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
    ],
    createdAt: DateTime.now(),
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
    wishListId: defaultWhishlists[0].id,
    favorite: true,
    brand: firewoodBrand,
    remainingNumber: 5,
    nOfComments: 50,
  ),
//? product 2
  ProductModel(
    id: Uuid().v4(),
    name: 'منتج ثاني',
    lovesNumber: 20,
    availableSize: [
      Sizes.s,
      Sizes.m,
      Sizes.xxl,
    ],
    price: 50,
    store: stores[1],
    fullDesc:
        'وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا ',
    shortDesc: 'قميص ابيض فاتح جميل اوي',
    imagesPath: [
      'assets/images/2.jpg',
      'assets/images/1.jpg',
      'assets/images/3.jpg',
    ],
    createdAt: DateTime.now(),
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
    brand: adidasBrand,
    remainingNumber: 0,
  ),
//? product 3
  ProductModel(
    id: Uuid().v4(),
    name: 'منتج ثالث',
    price: 669,
    lovesNumber: 20,
    store: stores[2],
    shortDesc: 'قميص ابيض فاتح جميل اوي',
    imagesPath: [
      'assets/images/3.jpg',
      'assets/images/1.jpg',
      'assets/images/2.jpg',
    ],
    createdAt: DateTime.now(),
    availableColors: productColors,
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
  ),
//?
];
