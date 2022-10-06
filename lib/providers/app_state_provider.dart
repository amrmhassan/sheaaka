import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  //? first time bool
  bool firstTime = false;
  void setFirstTime(bool b) {
    firstTime = b;
    notifyListeners();
  }
}
