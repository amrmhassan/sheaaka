// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';

class NearbyStoresNoLocation extends StatelessWidget {
  final VoidCallback onTap;
  const NearbyStoresNoLocation({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/pin.png',
                width: largeIconSize,
                color: kSecondaryColor,
              ),
              VSpace(factor: .5),
              Text(
                'لابد من تحديد موقعك لمعرفة المحلات القريبة',
                style: h4TextStyleInactive,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
