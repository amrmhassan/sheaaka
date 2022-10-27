// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/models_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';

class ChooseLocationScreen extends StatelessWidget {
  static const String routeName = '/choose-location-screen';
  const ChooseLocationScreen({super.key});

  String getAdressFromPlace(Placemark place) {
    String fullAddress = '';
    String? country = place.country;
    String? governorate = place.administrativeArea == null
        ? null
        : place.administrativeArea!.replaceAll(' Governorate', '');
    String? subGoverNorate = place.subAdministrativeArea;
    String? locality = place.locality;
    String? street = place.street;
    String? postalCode = place.postalCode;

    if (country != null) fullAddress += '$country/';
    if (governorate != null) fullAddress += '$governorate/';
    if (subGoverNorate != null) fullAddress += '$subGoverNorate/';
    if (locality != null) fullAddress += '$locality/';
    if (street != null) fullAddress += '$street/';
    if (postalCode != null) fullAddress += postalCode;
    return fullAddress;
  }

  @override
  Widget build(BuildContext context) {
    List<Placemark> locations =
        ModalRoute.of(context)!.settings.arguments as List<Placemark>;
    print('object');

    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'اختيار الموقع',
            rightTitle: true,
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ...locations.map(
                  (place) => ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: kVPad / 2, horizontal: kHPad / 2),
                    leading: CircleAvatar(
                      backgroundColor: kSecondaryColor,
                      radius: mediumIconSize,
                      child: Padding(
                        padding: EdgeInsets.all(largePadding),
                        child: Image.asset(
                          'assets/icons/pin.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context, getAdressFromPlace(place));
                    },
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (place.country != null)
                              Text(
                                place.country.toString(),
                                style: h3LiteTextStyle,
                              ),
                            if (place.subAdministrativeArea != null)
                              Text(
                                ',${place.subAdministrativeArea}',
                                style: h3LiteTextStyle,
                              ),
                            Spacer(),
                            if (place.name != null)
                              Text(
                                place.name.toString(),
                                style: h4TextStyle,
                              ),
                          ],
                        ),
                        Row(
                          children: [
                            if (place.locality != null)
                              Expanded(
                                child: Text(
                                  place.locality.toString(),
                                  style: h4TextStyleInactive,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            HSpace(),
                            Text(
                              place.administrativeArea
                                  .toString()
                                  .replaceAll(' Governorate', ''),
                              style: h4TextStyleInactive,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
