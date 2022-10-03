// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class PhoneNumberData extends StatelessWidget {
  final String phoneNumber;
  final VoidCallback deletePhone;
  const PhoneNumberData({
    Key? key,
    required this.deletePhone,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: deletePhone,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: kHPad / 2,
        vertical: kVPad / 2,
      ),
      child: Row(
        children: [
          Text(
            phoneNumber,
            style: h3InactiveTextStyle,
          ),
          Spacer(),
          Image.asset(
            'assets/icons/delete.png',
            width: smallIconSize,
            color: kDangerColor,
          ),
        ],
      ),
    );
  }
}
