// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/models/brand_model.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/models/whishlist_model.dart';
import 'package:uuid/uuid.dart';

class DataCreator {
  List<ProductModel> fProducts = [];
  List<StoreModel> fStores = [];
  List<WishListModel> fWishlists = [];
  List<OfferModel> fOffers = [];

  DataCreator() {
    createData();
  }
//? to create fast bool random
  bool rb() {
    return Random().nextBool();
  }

//? to create random int
  int r(int l) {
    return Random().nextInt(l);
  }

//? to create random names in arabic with length
  String makeName(int length) {
    String l = 'ابتثجحخدذرزسشصضطظعغفقكلمنهوي';
    List<String> letters = l.split('');
    List<String> n = [];
    for (int i = 0; i < length; i++) {
      int random = r(l.length);
      n.add(letters[random]);
    }
    return n.join();
  }

//? to create random names in english with length
  String makeEnglishName(int length) {
    String l = 'abcdefghijklmnopqrstuvwxyz';
    List<String> letters = l.split('');
    List<String> n = [];
    for (int i = 0; i < length; i++) {
      int random = r(l.length);
      n.add(letters[random]);
    }
    return n.join();
  }

//? to create random store offer model
  OfferModel makeStoreOffer() {
    String id = Uuid().v4();
    int imgNum = r(10) + 1;
    String imagePath = 'assets/images/fake/$imgNum.jpg';
    String title = makeName(5);
    DateTime createdAt = DateTime.now().subtract(Duration(days: r(10)));
    DateTime endAt = createdAt.add(Duration(days: r(5)));

    return OfferModel(
      id: id,
      imagePath: imagePath,
      title: title,
      createdAt: createdAt,
      endAt: endAt,
    );
  }

//? to create random store model
  StoreModel makeStoreModel() {
    String id = Uuid().v4();
    int imgNum = r(10) + 1;
    String coverImagePath = 'assets/images/fake/store$imgNum.jpg';
    String logoImagePath = 'assets/images/fake/trader$imgNum.jpg';
    int followers = r(50000);
    String name = makeName(10);
    List<OfferModel> offers = List.generate(r(10), (index) => makeStoreOffer());
    double latitude = Random().nextDouble() + 30;
    double longitude = Random().nextDouble() + 31;
    LatLng location = LatLng(latitude, longitude);
    String desc = makeName(100);
    double rating = Random().nextInt(4) + Random().nextDouble();

    return StoreModel(
      id: id,
      coverImagePath: coverImagePath,
      logoImagePath: logoImagePath,
      followers: followers,
      name: name,
      offers: offers,
      location: location,
      desc: desc,
      rating: rating,
    );
  }

//? to create random product model
  ProductModel makeProductModel(StoreModel store, [String? wishListId]) {
    String id = Uuid().v4();
    String name = makeName(6);
    DateTime createdAt = DateTime.now().subtract(Duration(days: r(50)));
    int lovesNumber = Random().nextInt(2000);
    double price = Random().nextDouble() + Random().nextInt(100);
    List<String> imagesPath = List.generate(4, (index) {
      int imgNum = r(10) + 1;
      return 'assets/images/fake/$imgNum.jpg';
    });
    String brandName = makeEnglishName(5);
    int nOfComments = Random().nextInt(40);
    String fullDesc = makeName(100);
    int remainingNumber = Random().nextInt(10);
    double rating = Random().nextInt(4) + Random().nextDouble();
    String shortDesc = makeName(20);
    List<Color> availableColors = List.generate(
      r(5),
      (index) =>
          Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    );
    DateTime offerEnd = DateTime.now().add(Duration(days: r(10)));
    double oldPrice = Random().nextDouble() + Random().nextInt(200);

    return ProductModel(
      id: id,
      name: name,
      store: store,
      imagesPath: imagesPath,
      createdAt: createdAt,
      lovesNumber: lovesNumber,
      price: price,
      brand: BrandModel(name: brandName),
      nOfComments: nOfComments,
      favorite: rb(),
      hasOffer: rb(),
      fullDesc: fullDesc,
      remainingNumber: remainingNumber,
      rating: rating,
      shortDesc: shortDesc,
      availableColors: availableColors,
      availableSize: [
        Sizes.l,
        Sizes.xl,
        Sizes.xxl,
      ],
      offerEnd: offerEnd,
      oldPrice: oldPrice,
      wishListId: rb() ? wishListId : null,
    );
  }

//? to make a random wishlist model
  WishListModel makeWishListModel() {
    String id = Uuid().v4();
    String name = makeName(5);
    DateTime createdAt = DateTime.now().subtract(Duration(days: r(50)));

    return WishListModel(
      id: id,
      name: name,
      createdAt: createdAt,
    );
  }

  void createData() {
//? a list of 50 offers
    fOffers = List.generate(
      50,
      (index) => makeStoreOffer(),
    );
//? a list of 5 wishlist
    fWishlists = List.generate(
      5,
      (index) => makeWishListModel(),
    );
//? a list of 50 store models
    fStores = List.generate(50, (index) => makeStoreModel());
//? a list of 200 products
    fProducts = List.generate(
      200,
      (i) => makeProductModel(
        fStores[r(fStores.length)],
        fWishlists[r(fWishlists.length)].id,
      ),
    );
  }
}

DataCreator dc = DataCreator();
