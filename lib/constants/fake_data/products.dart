// ignore_for_file: prefer_const_constructors

import 'package:project/constants/fake_data/stores.dart';
import 'package:project/models/product_model.dart';

List<ProductModel> homeProducts = [
  ProductModel(
    name: 'منتج أول',
    price: 144.5,
    oldPrice: 200,
    lovesNumber: 10,
    rating: 4.5,
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
    name: 'منتج ثاني',
    lovesNumber: 20,
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
    remainingNumber: 1,
  ),
  ProductModel(
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
    hasOffer: true,
    offerEnd: DateTime.now().add(Duration(days: 5)),
  ),
];
