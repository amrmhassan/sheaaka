// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:project/helpers/data_creator.dart';
import 'package:project/models/store_model.dart';

class StoreProvider extends ChangeNotifier {
  List<StoreModel> stores = [...dc.fStores];

  StoreModel getStoreById(String id) {
    return stores.firstWhere((element) => element.id == id);
  }
}
