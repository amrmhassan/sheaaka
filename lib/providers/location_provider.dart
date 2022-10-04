// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:location/location.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/general_utils.dart';

class LocationProvider extends ChangeNotifier {
  LocationData? locationData;
  final Location location = Location();
  StreamSubscription? locationSubscription;

//? getting location and listen to location updates
  Future<void> fetchAndUpdateUserLocation(BuildContext context,
      [Function(LocationData even)? callback]) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    //* enabling location service
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      showSnackBar(context, 'من فضلك قم بتفعيل خدمة الموقع', SnackBarType.info);
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw CustomError(ErrorsTypes.locationNotEnabled);
      }
    }
    //* granting location permission
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw CustomError(ErrorsTypes.locationPermissionNotGranted);
      }
    }

    locationData = await location.getLocation();
    notifyListeners();
    //* stopping the previous listener before creating a new one
    if (locationSubscription != null) {
      // print('---------------000000000');

      if (kDebugMode) {
        // print('*********');
        // print("Location subscription isn't null");
        // print('*********');
      }
      await locationSubscription!.cancel();
    }
    locationSubscription = location.onLocationChanged.listen((event) {
      locationData = event;
      if (callback != null) {
        // print('---------------000000000');
        if (kDebugMode) {
          // print('---------------------------');
          // print('Updating stores distances');
          // print(event.latitude);
          // print(event.longitude);
          // print('---------------------------');
        }

        callback(event);
      }
    });
  }
}
