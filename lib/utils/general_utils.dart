import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project/constants/colors.dart';
import 'package:project/models/types.dart';

//? to handle the loves to string
String lovesToString(int n) {
  if (n < 1000) {
    return n.toString();
  } else {
    return '${doubleToString(n / 1000, 1)}K';
  }
}

//? to handle double to string
String doubleToString(double d, [int roundTo = 2]) {
  List<String> s = d.toStringAsFixed(roundTo).split('');
  for (int i = 0; i < roundTo; i++) {
    if (s.last == '0') {
      s.removeLast();
    }
  }

  if (s.last == '.') {
    s.removeLast();
  }
  return s.join();
}

//? date to string date
String dateToString(DateTime date) {
  return '${date.year}-${date.month}-${date.day}';
}

//? make random list with random length from a list
List getRandomList(List originalList, [int? length]) {
  List randomList = [];

  int randomListLength = length ?? Random().nextInt(originalList.length + 1);

  int i = 0;

  while (i < randomListLength) {
    dynamic item = originalList[Random().nextInt(originalList.length)];
    if (!randomList.contains(item)) {
      randomList.add(item);
      i++;
    }
  }

  return randomList;
}

//? for checking for the internet
Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

//? checking if number
bool isNumeric(String? s) {
  if (s == null) return false;
  return double.tryParse(s) != null;
}

//? for showing a quick snack bar
void showSnackBar(
    BuildContext context, String message, SnackBarType snackBarType,
    [bool aboveBottomNavBar = false]) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: aboveBottomNavBar ? SnackBarBehavior.floating : null,
      content: Text(
        message,
      ),
      backgroundColor: snackBarType == SnackBarType.success
          ? kGreenColor
          : snackBarType == SnackBarType.error
              ? kDangerColor
              : null,
      action: SnackBarAction(
        label: 'تم',
        textColor: snackBarType == SnackBarType.error ||
                snackBarType == SnackBarType.success ||
                snackBarType == SnackBarType.info
            ? Colors.white
            : null,
        onPressed: () {},
      ),
    ),
  );
}

//? get location from location data
LatLng locationFromLocationData(LocationData locationData) {
  return LatLng(locationData.latitude!, locationData.longitude!);
}
