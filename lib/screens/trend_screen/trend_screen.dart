// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

//? this screen will have the trending products depending on the gender
//? and the best offers
//? it will has all sorts of products cards like Trending, best offers....

class TrendScreen extends StatelessWidget {
  const TrendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Trending screen will be here',
          style: h4TextStyleInactive,
        ),
      ],
    );
  }
}
