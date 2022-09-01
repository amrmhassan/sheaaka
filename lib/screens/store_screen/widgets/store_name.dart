// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class StoreName extends StatelessWidget {
  const StoreName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'نيو فاشون',
      style: h2TextStyle,
    );
  }
}
