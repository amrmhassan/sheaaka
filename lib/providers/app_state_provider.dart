// ignore_for_file: use_build_context_synchronously

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
  Future<void> setTraderMode(bool t) async {
    traderMode = t;
    notifyListeners();
    await SharedPrefHelper.setBool(appTarderModeKey, t);
  }

  Future<void> initTraderModeBool() async {
    bool traderMode = await SharedPrefHelper.getBool(appTarderModeKey) ?? false;
    setTraderMode(traderMode);
  }
}
