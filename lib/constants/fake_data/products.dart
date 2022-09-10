// ignore_for_file: prefer_const_constructors

import 'package:project/constants/fake_data/stores.dart';
import 'package:project/constants/product_constants.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';

List<ProductModel> homeProducts = [
  ProductModel(
    id: 'dlfjkdljflk',
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
    store: storeModel_1,
    imagesPath: [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
    ],
    createdAt: DateTime.now(),
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
    bookMark: true,
    favorite: true,
    brand: 'Firewood',
    remainingNumber: 5,
    nOfComments: 50,
  ),
  ProductModel(
    id: 'sljdfoiwe',
    name: 'منتج ثاني',
    lovesNumber: 20,
    availableSize: [
      Sizes.s,
      Sizes.m,
      Sizes.xxl,
    ],
    price: 50,
    store: storeModel_1,
    fullDesc:
        'وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا وصف كتير هنا ',
    shortDesc: 'قميص ابيض فاتح جميل اوي',
    imagesPath: [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
    ],
    createdAt: DateTime.now(),
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
    brand: 'Adidas',
    remainingNumber: 0,
  ),
  ProductModel(
    id: 'aldjfaloisd',
    name: 'منتج ثالث',
    price: 669,
    lovesNumber: 20,
    store: storeModel_1,
    shortDesc: 'قميص ابيض فاتح جميل اوي',
    imagesPath: [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
    ],
    createdAt: DateTime.now(),
    availableColors: productColors,
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
  ),
];
