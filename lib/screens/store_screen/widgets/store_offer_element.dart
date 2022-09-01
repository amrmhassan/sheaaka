// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/store_screen/widgets/store_offer_photo.dart';

const double _margin = kHPad;

class StoreOfferElement extends StatelessWidget {
  final bool start;

  const StoreOfferElement({
    Key? key,
    this.start = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: _margin,
        right: start ? _margin : 0,
      ),
      child: Column(
        children: [
          StoreOfferPhoto(),
          VSpace(factor: .4),
          Text(
            'شيرت بولو',
            style: h4TextStyle.copyWith(
              height: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
