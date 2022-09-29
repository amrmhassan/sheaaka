// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class UserGenderElement extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool active;

  const UserGenderElement({
    Key? key,
    this.active = false,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: smallIconSize,
            height: smallIconSize,
            padding: EdgeInsets.all(smallPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border: Border.all(
                width: 2,
                color: active ? kPrimaryColor : kSecondaryColor,
              ),
            ),
            child: active
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(500),
                    ),
                  )
                : SizedBox(),
          ),
          HSpace(factor: .4),
          Text(
            title,
            style: h4TextStyle,
          ),
        ],
      ),
    );
  }
}
