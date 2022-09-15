// ignore_for_file: prefer_const_constructors

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/store_model.dart';

List<StoreModel> stores = [
  StoreModel(
    id: 'id1',
    location: LatLng(30.46916610638052, 31.180741972116717),
    coverImagePath: 'assets/images/store1.jpg',
    name: 'محل اول',
    logoImagePath: 'assets/images/trader1.jpg',
    followers: 5,
    rating: 4.5,
    desc: 'محل شبابي جميل ',
    offers: [
      OfferModel(
        id: 'id1',
        imagePath: 'assets/images/1.jpg',
        title: 'عرض جامد',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-20"),
      ),
      OfferModel(
        id: 'id2',
        imagePath: 'assets/images/2.jpg',
        title: 'عرض جميل',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-11"),
      ),
      OfferModel(
        id: 'id3',
        imagePath: 'assets/images/3.jpg',
        title: 'عرض حلو',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-25"),
      ),
    ],
  ),
  StoreModel(
    id: 'id2',
    location: LatLng(30.470805025237592, 31.18308514940433),
    coverImagePath: 'assets/images/store2.jpg',
    name: 'محل تاني',
    logoImagePath: 'assets/images/trader2.jpg',
    followers: 5,
    offers: [],
  ),
  StoreModel(
    id: 'id3',
    location: LatLng(30.47304653280435, 31.17814609614443),
    coverImagePath: 'assets/images/store3.jpg',
    name: 'محل تالت',
    logoImagePath: 'assets/images/trader3.jpg',
    followers: 60,
    offers: [
      OfferModel(
        id: 'id4',
        imagePath: 'assets/images/1.jpg',
        title: 'عرض جامد',
        createdAt: DateTime.parse("2022-09-10"),
        endAt: DateTime.parse("2022-09-20"),
      ),
    ],
  ),
];
