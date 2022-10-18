import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project/constants/styles.dart';
import 'package:project/trader_app/constants/colors.dart';

class CustomNumberPicker extends StatelessWidget {
  final String title;
  final int value;
  final Function(int v) onChanged;
  final int minValue;
  final int maxValue;

  const CustomNumberPicker({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.value,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberPicker(
          minValue: minValue,
          maxValue: maxValue,
          value: value,
          onChanged: onChanged,
          textStyle: h3LiteTextStyle.copyWith(color: kTraderSecondaryColor),
          selectedTextStyle: h1TextStyle.copyWith(color: kTraderPrimaryColor),
        ),
        Text(
          title,
          style: h3InactiveTextStyle.copyWith(
            color: kTraderBlackColor,
          ),
        ),
      ],
    );
  }
}
