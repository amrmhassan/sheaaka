// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:provider/provider.dart';

Future<void> loadData(BuildContext context) async {
  //? the loading in this screen only for the network checking
  await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
  await Provider.of<ProductsProvider>(context, listen: false)
      .reloadHomeProducts(true);
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndUpdateFavoriteProducts();
  }
}
