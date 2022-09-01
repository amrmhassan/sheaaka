// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class StoreCategoryElement extends StatelessWidget {
  final bool active;
  final String title;
  const StoreCategoryElement({
    Key? key,
    this.active = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      alignment: Alignment.bottomCenter,
      onTap: () {},
      backgroundColor: Colors.transparent,
      borderRadius: 0,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 2,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 3,
              color: active ? Colors.black : Colors.transparent,
            ),
          ),
        ),
        child: Text(
          title,
          style: h3TextStyle,
        ),
      ),
    );
  }
}
