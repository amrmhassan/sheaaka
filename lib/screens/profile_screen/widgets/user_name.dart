// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class UserName extends StatelessWidget {
  final String name;
  const UserName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        name.split(' ').first,
        overflow: TextOverflow.ellipsis,
        style: h2TextStyle,
      ),
    );
  }
}
