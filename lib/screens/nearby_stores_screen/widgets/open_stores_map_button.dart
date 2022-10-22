// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class OpenStoresMapButton extends StatelessWidget {
  final bool active;
  const OpenStoresMapButton({
    Key? key,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return active
        ? Positioned(
            bottom: kVPad,
            right: kHPad,
            child: ButtonWrapper(
              padding: EdgeInsets.all(largePadding),
              onTap: () {},
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: kLightColor,
                boxShadow: [defaultBoxShadow],
              ),
              child: Image.asset(
                'assets/icons/map1.png',
              ),
            ),
          )
        : SizedBox();
  }
}
