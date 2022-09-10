// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/styles.dart';

class RemainInStock extends StatelessWidget {
  final int num;
  const RemainInStock({
    Key? key,
    required this.num,
  }) : super(key: key);

  String pluralString(int n) {
    if (n == 1) {
      return 'قطعة واحدة';
    } else if (n == 2) {
      return 'قطعتين';
    } else if (n > 10) {
      return 'قطعة';
    } else {
      return 'قطع';
    }
  }

  @override
  Widget build(BuildContext context) {
    var dangerTextStyle = h3TextStyle.copyWith(
      color: kDangerColor,
      fontWeight: FontWeight.bold,
    );
    return num < 1
        ? Text(
            'المنتج غير متوفر حاليا',
            style: h4LiteTextStyle.copyWith(color: kDangerColor),
          )
        : RichText(
            text: TextSpan(
              style: h4TextStyle.copyWith(
                color: kActiveTextColor,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(text: 'باقي'),
                TextSpan(text: ' '),
                if (!(num == 1 || num == 2))
                  TextSpan(
                    text: num.toString(),
                    style: dangerTextStyle,
                  ),
                TextSpan(text: ' '),
                TextSpan(
                  text: pluralString(num),
                  style: num == 1 || num == 2 ? dangerTextStyle : null,
                ),
              ],
            ),
          );
  }
}
