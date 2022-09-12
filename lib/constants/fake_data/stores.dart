// ignore_for_file: prefer_const_constructors

import 'package:project/models/offer_model.dart';
import 'package:project/models/store_model.dart';

List<StoreModel> stores = [
  StoreModel(
    id: 'id1',
    coverImagePath: 'assets/images/store1.jpg',
    name: 'محل اول',
    logoImagePath: 'assets/images/trader1.jpg',
    followers: 5,
    rating: 4.5,
    desc: 'محل شبابي جميل ',
    offers: [
      OfferModel(
        imagePath: 'assets/images/1.jpg',
        title: 'عرض جامد',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-20"),
      ),
      OfferModel(
        imagePath: 'assets/images/2.jpg',
        title: 'عرض جميل',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-11"),
      ),
      OfferModel(
        imagePath: 'assets/images/3.jpg',
        title: 'عرض حلو',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-25"),
      ),
    ],
  ),
  StoreModel(
    id: 'id2',
    coverImagePath: 'assets/images/store2.jpg',
    name: 'محل تاني',
    logoImagePath: 'assets/images/trader2.jpg',
    followers: 5,
    offers: [],
  ),
  StoreModel(
    id: 'id3',
    coverImagePath: 'assets/images/store3.jpg',
    name: 'محل تالت',
    logoImagePath: 'assets/images/trader3.jpg',
    followers: 60,
    offers: [],
  ),
];
