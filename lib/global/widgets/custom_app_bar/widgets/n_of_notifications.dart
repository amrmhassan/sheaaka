// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';

class NOfNotifications extends StatelessWidget {
  final int nOfNotifications;
  const NOfNotifications({
    Key? key,
    required this.nOfNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -23,
      top: -8,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
            ),
            child: Image.asset(
              'assets/icons/chat.png',
              color: kPrimaryColor,
            ),
          ),
          Text(
            nOfNotifications.toString(),
            style: h4LiteTextStyle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
