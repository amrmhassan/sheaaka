import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/styles.dart';
import 'package:project/utils/general_utils.dart';

class StoreDistance extends StatelessWidget {
  final LatLng currentLocation;
  final LatLng storeLocation;
  const StoreDistance({
    Key? key,
    required this.currentLocation,
    required this.storeLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      getLocation(),
      style: h4LiteTextStyle.copyWith(color: Colors.white),
    );
  }

  String getLocation() {
    double distance = Geolocator.distanceBetween(
      storeLocation.latitude,
      storeLocation.longitude,
      currentLocation.latitude,
      currentLocation.longitude,
    );
    if (distance < 1000) {
      return '${doubleToString(distance, 0)}م';
    } else {
      return '${doubleToString(distance / 1000, 1)}كم';
    }
  }
}
