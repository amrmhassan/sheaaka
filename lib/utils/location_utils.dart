// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:project/constants/errors_constants.dart';
import 'package:project/models/custom_error.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/location_provider.dart';
import 'package:project/screens/choose_location_screen/choose_location_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

//? for handling locating and choose the address
Future<void> handleLocating({
  required Function(LatLng? location) setLocation,
  required BuildContext context,
  required Function(String userPlace) callback,
  required VoidCallback setStartLoading,
  required VoidCallback setEndLoading,
}) async {
  try {
    setStartLoading();
    LocationData locationData =
        await Provider.of<LocationProvider>(context, listen: false)
            .handleGetLocation(context);
    if (locationData.latitude == null || locationData.longitude == null) {
      throw CustomError(errorType: ErrorsTypes.errorGettingLocation);
    }
    //* setting the location
    LatLng? latlng = LatLng(locationData.latitude!, locationData.longitude!);
    setLocation(latlng);

    //* converting the coordinates to address
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);
    //* push a new screen to let the choose from the locations
    String? userPlace = await Navigator.pushNamed(
      context,
      ChooseLocationScreen.routeName,
      arguments: placemarks,
    ) as String?;
    if (userPlace != null) {
      callback(userPlace);
    }
  } catch (e) {
    showSnackBar(
        context: context,
        message: e.toString(),
        snackBarType: SnackBarType.error);
  }
  setEndLoading();
}
