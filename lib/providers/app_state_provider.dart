import 'package:flutter/material.dart';
import 'package:project/constants/shared_pref_constants.dart';
import 'package:project/helpers/shared_pref_helper.dart';

class AppStateProvider extends ChangeNotifier {
  //? first time bool
  bool firstTime = false;
  void setFirstTime(bool b) {
    firstTime = b;
    notifyListeners();
  }

  //? trader mode
  bool traderMode = false;
  void setTraderMode(bool t) async {
    traderMode = t;
    await SharedPrefHelper.setBool(kAppStartModeKey, t);
    notifyListeners();
  }
}
