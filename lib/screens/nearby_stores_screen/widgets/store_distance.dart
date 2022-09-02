import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';

class StoreDistance extends StatelessWidget {
  const StoreDistance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '5 كم',
      style: h4LiteTextStyle.copyWith(color: Colors.white),
    );
  }
}
