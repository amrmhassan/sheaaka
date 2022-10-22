import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';

class Dot extends StatelessWidget {
  const Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kSecondaryColor,
      ),
    );
  }
}
