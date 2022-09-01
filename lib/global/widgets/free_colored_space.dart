// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FreeColoredSpace extends StatelessWidget {
  final int number;
  final double? margin;
  const FreeColoredSpace({
    Key? key,
    required this.number,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        number,
        (index) => Container(
          margin: EdgeInsets.only(bottom: margin ?? 0),
          child: FreeSpaceElement(),
        ),
      ),
    );
  }
}

class FreeSpaceElement extends StatelessWidget {
  const FreeSpaceElement({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.red,
      width: double.infinity,
    );
  }
}
