// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';

class Taps extends StatelessWidget {
  final List<Widget> taps;
  const Taps({
    Key? key,
    required this.taps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kVPad * 2,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
          )
        ],
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: taps,
        ),
      ),
    );
  }
}
