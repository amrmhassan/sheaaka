// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/profile_screen/widgets/profile_summary.dart';

class UserName extends StatelessWidget {
  final String name;
  const UserName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //* this radius is from the profile image radius, to be at the center under the profile image
      width: profileImageRadius,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          name.split(' ').first,
          overflow: TextOverflow.ellipsis,
          style: h2TextStyle,
        ),
      ),
    );
  }
}
