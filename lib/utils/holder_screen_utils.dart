// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/constants/shared_pref_constants.dart';
import 'package:project/helpers/shared_pref_helper.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

//? reload data for home refresh or for the app loading
Future<void> _reloadData(BuildContext context) async {
  await Provider.of<StoreProvider>(context, listen: false)
      .fetchAndUpdateOffers(true);
  List<OfferModel> offers =
      Provider.of<StoreProvider>(context, listen: false).offers;
  //* getting stores
  await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
  //* fetching all products
  await Provider.of<ProductsProvider>(context, listen: false)
      .fetchAllProducts(offers, false);
  await Provider.of<ProductsProvider>(context, listen: false)
      .fetchAllProducts(offers, false);
  await Provider.of<AdsProvider>(context, listen: false)
      .fetchAndUpdateAds(true);
}

//? loading data from firestore
Future<void> loadData(BuildContext context) async {
  //* setting first time open
  await firstTimeOpenApp(context);
  //* getting offers from database
  await _reloadData(context);

  //* the loading in this screen only for the network checking
  // await Provider.of<ProductsProvider>(context, listen: false)
  //     .reloadHomeProducts(offers, true);

  //* getting cart items from local sqlite
  await Provider.of<CartProvider>(context, listen: false)
      .fetchAndUpdateCartItems();
  //* getting wshlists from local sqlite
  await Provider.of<WishListsProvider>(context, listen: false)
      .fetchWishlistsAndWishlistsItems();
  await handleUserData(context);
}

//? load data for home screen
Future<void> loadDataForHomeScreen(BuildContext context) async {
  //* the loading in this screen only for the network checking
  await _reloadData(context);
}

//? checking user store if trader
Future<void> handleUserData(BuildContext context) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    //* fetch his liked products
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndUpdateFavoriteProducts();
    //* get the user data by UID and set his
    UserModel userModel =
        await Provider.of<UserProvider>(context, listen: false)
            .getUserDataByUID(currentUser.uid);
    Provider.of<UserProvider>(context, listen: false)
        .setCurrentUserData(userModel);
    //* getting user orders
    await Provider.of<OrdersProvider>(context, listen: false)
        .fetchUpdateUserOrders();

    if (userModel.userRole == UserRole.trader) {
      try {
        // to open store dashboard if trader and signup
        Provider.of<StoreProvider>(context, listen: false)
            .getStoreByOwnerUID(currentUser.uid);
        //* checking if has a store but never opened it before then open the store
        bool? appMode = await SharedPrefHelper.getBool(appTarderModeKey);
        if (appMode == null) {
          return await Provider.of<AppStateProvider>(context, listen: false)
              .setTraderMode(true);
        }
      } catch (e) {
        // the user is a trader but didn't create his store yet, so you must warn him
        Provider.of<UserProvider>(context, listen: false)
            .setUserStoreWarning(true);
        // then forward him to the signup store
        showSnackBar(
          context: context,
          message: 'لم تقم باستكمال انشاء متجرك',
        );
        Navigator.of(context).pushNamed(SignUpStoreScreen.routeName,
            arguments: userModel.userProfilePhoto);
      }
    }
  }
}

//? updating firstTimeOpenApp
Future<void> firstTimeOpenApp(BuildContext context) async {
  bool f = await SharedPrefHelper.firstTimeRunApp();
  Provider.of<AppStateProvider>(context, listen: false).setFirstTime(f);
}
