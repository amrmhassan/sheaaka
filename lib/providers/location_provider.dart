// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/helpers/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/general_utils.dart';

class LocationProvider extends ChangeNotifier {
  LocationData? locationData;
  final Location location = Location();
  StreamSubscription? locationSubscription;

//? getting location and listen to location updates
  Future<void> fetchAndUpdateUserLocation(BuildContext context,
      [Function(LocationData event)? callback]) async {
    try {
      locationData = await handleGetLocation(context);
      notifyListeners();
    } catch (e, stack) {
      throw CustomError(
        errorType: ErrorsTypes.errorGettingLocation,
        stackTrace: stack,
        errString: e,
      );
    }

    //* stopping the previous listener before creating a new one
    if (locationSubscription != null) {
      await locationSubscription!.cancel();
    }
    // locationSubscription = location.onLocationChanged.listen((event) {
    //   locationData = event;
    //   if (callback != null) {
    //     callback(event);
    //   }
    // });
  }

  Future<LocationData?> handleGetLocation(BuildContext context) async {
    //! this code will stop getting location data, just to upload the app to google play(cause i don't understand their privacy policy)
    if (5 == 5) {
      return null;
    }
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
        throw CustomError(
          errorType: ErrorsTypes.locationNotEnabled,
          stackTrace: StackTrace.current,
        );
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
    return await location.getLocation();
  }
}
