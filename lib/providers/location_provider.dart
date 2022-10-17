// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
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
      showSnackBar(
          context: context,
          message: 'من فضلك قم بتفعيل خدمة الموقع',
          snackBarType: SnackBarType.info);
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw CustomError(errorType: ErrorsTypes.locationNotEnabled);
      }
    }
    //* granting location permission
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw CustomError(errorType: ErrorsTypes.locationPermissionNotGranted);
      }
    }

    try {
      locationData = await location.getLocation();
      notifyListeners();
    } catch (e, stack) {
      throw CustomError(
          errorType: ErrorsTypes.errorGettingLocation, stackTrace: stack);
    }

    //* stopping the previous listener before creating a new one
    if (locationSubscription != null) {
      await locationSubscription!.cancel();
    }
    locationSubscription = location.onLocationChanged.listen((event) {
      locationData = event;
      if (callback != null) {
        callback(event);
      }
    });
  }
}
