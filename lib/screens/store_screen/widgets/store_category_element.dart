// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';

class StoreCategoryElement extends StatelessWidget {
  final bool active;
  final String title;
  final TextStyle? style;
  final int? number;
  final VoidCallback? onTap;

  const StoreCategoryElement({
    Key? key,
    this.active = false,
    required this.title,
    this.style,
    this.number,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      alignment: Alignment.bottomCenter,
      onTap: onTap ?? () {},
      backgroundColor: Colors.transparent,
      borderRadius: 0,
      child: Row(
        children: [
          Container(
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
            child: Row(
              children: [
                Text(
                  title,
                  style: style ?? h3TextStyle,
                ),
                if (number != null)
                  HSpace(
                    factor: .3,
                  ),
                if (number != null)
                  Container(
                    alignment: Alignment.center,
                    width: smallIconSize,
                    height: smallIconSize,
                    decoration: BoxDecoration(
                      color: active
                          ? kBlackColor
                          : kSecondaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(smallBorderRadius),
                    ),
                    child: Text(
                      number.toString(),
                      style: h4LiteTextStyle.copyWith(
                        height: 1.3,
                        color: active ? Colors.white : kActiveTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
