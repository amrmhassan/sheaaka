// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/models/types.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

Future<void> loadData(BuildContext context) async {
  //? the loading in this screen only for the network checking
  await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
  await Provider.of<ProductsProvider>(context, listen: false)
      .reloadHomeProducts(true);
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    //? fetch his liked products
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndUpdateFavoriteProducts();
    //? get the user data by UID and set his
    UserModel userModel =
        await Provider.of<UserProvider>(context, listen: false)
            .getUserDataByUID(currentUser.uid);
    if (userModel.userRole == UserRole.trader) {
      try {
        Provider.of<StoreProvider>(context, listen: false)
            .getStoreByOwnerUID(currentUser.uid);
      } catch (e) {
        // the user is a trader but didn't create his store yet, so you must warn him
        Provider.of<UserProvider>(context, listen: false)
            .setUserStoreWarning(true);
        // then forward him to the signup store
        showSnackBar(context, 'لم تقم باستكمال انشاء متجرك', SnackBarType.info);
        Navigator.of(context).pushNamed(SignUpStoreScreen.routeName,
            arguments: userModel.userProfilePhoto);
      }
    }
  }
}
