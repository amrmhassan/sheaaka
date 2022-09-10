// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class PostInfo extends StatelessWidget {
  final String name;
  final String? shortDescription;

  const PostInfo({
    Key? key,
    required this.name,
    this.shortDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: h3TextStyle,
          ),
          Text(
            shortDescription ?? '',
            style: h4TextStyleInactive,
          ),
        ],
      ),
    );
  }
}
