// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';

class ApplyFilterButton extends StatelessWidget {
  const ApplyFilterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      width: double.infinity,
      backgroundColor: kPrimaryColor,
      padding: EdgeInsets.symmetric(vertical: kVPad / 2),
      onTap: () {},
      child: Text(
        'تطبيق الفلتر',
        style: h3LiteTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
