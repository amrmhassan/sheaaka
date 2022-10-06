// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/helpers/shared_pref_helper.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

//? loading data from firestore
Future<void> loadData(BuildContext context) async {
  await firstTimeOpenApp(context);
  //* the loading in this screen only for the network checking
  await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
  await Provider.of<ProductsProvider>(context, listen: false)
      .reloadHomeProducts(true);

  await checkTraderStore(context);
  await Provider.of<CartProvider>(context, listen: false)
      .fetchAndUpdateCartItems();
}

//? load data for home screen
Future<void> loadDataForHomeScreen(BuildContext context) async {
  //* the loading in this screen only for the network checking
  await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
  await Provider.of<ProductsProvider>(context, listen: false)
      .reloadHomeProducts(true);
}

//? checking user store if trader
Future<void> checkTraderStore(BuildContext context) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    //* fetch his liked products
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndUpdateFavoriteProducts();
    //* get the user data by UID and set his
    UserModel userModel =
        await Provider.of<authenticating>(context, listen: false)
            .getUserDataByUID(currentUser.uid);
    Provider.of<authenticating>(context, listen: false)
        .setCurrentUserData(currentUser, userModel);

    if (userModel.userRole == UserRole.trader) {
      try {
        Provider.of<StoreProvider>(context, listen: false)
            .getStoreByOwnerUID(currentUser.uid);
      } catch (e) {
        // the user is a trader but didn't create his store yet, so you must warn him
        Provider.of<authenticating>(context, listen: false)
            .setUserStoreWarning(true);
        // then forward him to the signup store
        showSnackBar(context, 'لم تقم باستكمال انشاء متجرك', SnackBarType.info);
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
