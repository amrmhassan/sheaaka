// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class StartSearchButton extends StatelessWidget {
  final VoidCallback onTap;
  final String searchQuery;

  const StartSearchButton({
    Key? key,
    required this.onTap,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (searchQuery.isNotEmpty)
        ? ButtonWrapper(
            alignment: Alignment.centerRight,
            onTap: onTap,
            backgroundColor: Colors.transparent,
            borderRadius: 0,
            padding: EdgeInsets.symmetric(horizontal: kHPad / 2),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: h3LiteTextStyle.copyWith(color: kActiveTextColor),
                children: [
                  TextSpan(text: 'بحث عن'),
                  TextSpan(text: " "),
                  TextSpan(
                    text: '"$searchQuery"',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ],
              ),
            ),
          )
        : SizedBox();
  }
}
