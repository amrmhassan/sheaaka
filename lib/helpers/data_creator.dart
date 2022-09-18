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

const int storesNumber = 10;
const int productsNumber = 10;
const int wishlistsNumber = 5;
const int offersNumber = 2;

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

  //? get random number of a list
  List<dynamic> getRandomList(List<dynamic> list, int n) {
    return List.generate(n, (index) => list[r(list.length)]);
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
  OfferModel makeStoreOffer(String imagePath, String title) {
    String id = Uuid().v4();
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
    int logoNum = r(10) + 1;
    String coverImagePath = 'assets/images/fake/store$imgNum.jpg';
    String logoImagePath = 'assets/images/fake/trader$logoNum.jpg';
    int followers = r(50000);
    String name = makeName(10);
    double latitude = Random().nextDouble() + 30;
    double longitude = Random().nextDouble() + 31;
    LatLng location = LatLng(latitude, longitude);
    String desc = makeName(10);
    double rating = Random().nextInt(4) + Random().nextDouble();

    return StoreModel(
      id: id,
      coverImagePath: coverImagePath,
      logoImagePath: logoImagePath,
      followers: followers,
      name: name,
      offers: [],
      location: location,
      desc: desc,
      rating: rating,
    );
  }

  void addOfferToStore(OfferModel offer, String storeId) {
    int i = fStores.indexWhere((element) => element.id == storeId);
    var s = fStores[i];
    s.offers.add(offer);
    fStores[i] = s;
  }

  //? to create random product model
  ProductModel makeProductModel(StoreModel store) {
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
      offerEnd: null,
      oldPrice: oldPrice,
      wishListId: null,
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

  void addOfferToProduct(String offerId, String productId, DateTime endAt) {
    int i = fProducts.indexWhere((element) => element.id == productId);
    ProductModel p = fProducts[i];
    p.offerEnd = endAt;
    fProducts[i] = p;
  }

  void addProductToWishList(String wishListId, String productId) {
    int i = fProducts.indexWhere((element) => element.id == productId);
    ProductModel p = fProducts[i];
    p.wishListId = wishListId;
    fProducts[i] = p;
  }

  void createData() {
    //? creating stores
    fStores = List.generate(storesNumber, (index) => makeStoreModel());
    //? make products
    fProducts = List.generate(
      productsNumber,
      (index) => makeProductModel(
        fStores[r(fStores.length)],
      ),
    );
    //? making offers and add them to products and stores
    fOffers = List.generate(offersNumber, (index) {
      ProductModel rp = fProducts[r(fProducts.length)];
      OfferModel offer = makeStoreOffer(rp.imagesPath[0], rp.name);
      addOfferToProduct(offer.id, rp.id, offer.endAt);
      addOfferToStore(offer, rp.store.id);
      return offer;
    });

    //? making 5 wishlist
    fWishlists = List.generate(wishlistsNumber, (index) {
      WishListModel w = makeWishListModel();

      return w;
    });

    for (var i = 0; i < 100; i++) {
      if (rb()) {
        ProductModel p = fProducts[r(fProducts.length)];
        WishListModel w = fWishlists[r(fWishlists.length)];
        addProductToWishList(w.id, p.id);
      }
    }
  }
}

DataCreator dc = DataCreator();

// //? a list of 50 offers
// fOffers = List.generate(
//   50,
//   (index) => makeStoreOffer(),
// );

// //? a list of 5 wishlist
// fWishlists = List.generate(
//   2,
//   (index) => makeWishListModel(),
// );

// //? a list of 50 store models

// fStores = List.generate(
//   5,
//   (index) => makeStoreModel(
//     rb() ? getRandomList(fOffers, r(20)) as List<OfferModel> : [],
//   ),
// );

// //? a list of 10 products
// fProducts = List.generate(
//   10,
//   (i) {
//     int random = r(fStores.length);
//     return makeProductModel(
//       fStores[random],
//       fOffers[random].createdAt,
//       fWishlists[r(fWishlists.length)].id,
//     );
//   },
// );
