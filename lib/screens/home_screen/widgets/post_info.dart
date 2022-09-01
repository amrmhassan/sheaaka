// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'قميص أبيض فاتح',
            style: h3TextStyle,
          ),
          Text(
            'قميص أبيض فاتح اللون للرجال',
            style: h4TextStyleInactive,
          ),
        ],
      ),
    );
  }
}
