// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class AddPropButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddPropButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      margin: EdgeInsets.only(left: kHPad / 2),
      onTap: onTap,
      padding: EdgeInsets.all(largePadding),
      width: ultraLargeIconSize,
      height: ultraLargeIconSize,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kTraderSecondaryColor.withOpacity(.5),
        ),
      ),
      child: Image.asset(
        'assets/icons/plus.png',
        color: kTraderNotifyColor,
      ),
    );
  }
}
