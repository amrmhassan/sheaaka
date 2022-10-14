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
  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

//? checking if number
bool isNumeric(String? s) {
  if (s == null) return false;
  return double.tryParse(s) != null;
}

//? for showing a quick snack bar
void showSnackBar({
  required BuildContext context,
  required String message,
  SnackBarType? snackBarType,
  bool aboveBottomNavBar = false,
  EdgeInsets? margin,
  VoidCallback? onActionTapped,
  String? actionString,
}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: aboveBottomNavBar ? SnackBarBehavior.floating : null,
      content: Text(
        message,
      ),
      backgroundColor:
          (snackBarType ?? SnackBarType.info) == SnackBarType.success
              ? kGreenColor
              : (snackBarType ?? SnackBarType.info) == SnackBarType.error
                  ? kDangerColor
                  : null,
      margin: margin,
      action: SnackBarAction(
        label: actionString ?? 'تم',
        textColor: (snackBarType ?? SnackBarType.info) == SnackBarType.error ||
                (snackBarType ?? SnackBarType.info) == SnackBarType.success ||
                (snackBarType ?? SnackBarType.info) == SnackBarType.info
            ? Colors.white
            : null,
        onPressed: onActionTapped ?? () {},
      ),
    ),
  );
}

//? get location from location data
LatLng locationFromLocationData(LocationData locationData) {
  return LatLng(locationData.latitude!, locationData.longitude!);
}
