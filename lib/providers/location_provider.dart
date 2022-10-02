// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/utils/general_utils.dart';

class LocationProvider extends ChangeNotifier {
  LocationData? locationData;
  Location location = Location();

//? getting location and listen to location updates
  Future<void> fetchAndUpdateUserLocation(BuildContext context) async {
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
    location.onLocationChanged.listen((event) {
      locationData = event;
    });
  }
}
