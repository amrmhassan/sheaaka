// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/store_screen/widgets/store_info_element.dart';

class StoreInfoModal extends StatelessWidget {
  final List<String> phones;
  final List<String> emails;
  final String? address;
  final LatLng? storeLocation;

  const StoreInfoModal({
    Key? key,
    required this.emails,
    required this.phones,
    required this.address,
    required this.storeLocation,
  }) : super(key: key);

  String parseAddress(String raw) {
    return raw.replaceAll(', ', '\n');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       'اسم صاحب المتجر',
        //       style: h3TextStyle,
        //     ),
        //     Text(
        //       'عمرو محمد',
        //       style: h3LiteTextStyle,
        //     )
        //   ],
        // ),
        if (address != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(),
              Text(
                'عنوان المحل',
                style: h3TextStyle,
              ),
              VSpace(),
              StoreInfoElement(info: parseAddress(address!)),
            ],
          ),
        if (emails.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(),
              Text(
                'الايميلات',
                style: h3TextStyle,
              ),
              VSpace(),
              ...emails.map(
                (e) => StoreInfoElement(
                  info: e,
                  allowCopy: true,
                ),
              ),
            ],
          ),
        if (phones.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace(),
              Text(
                'أرقام الهاتف',
                style: h3TextStyle,
              ),
              VSpace(),
              ...phones.map(
                (e) => StoreInfoElement(
                  info: e,
                  allowCopy: true,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
