import 'package:flutter/cupertino.dart';
import 'package:project/constants/fake_data/stores.dart';
import 'package:project/models/store_model.dart';

class StoreProvider extends ChangeNotifier {
  StoreModel getStoreById(String id) {
    return stores.firstWhere((element) => element.id == id);
  }
}
