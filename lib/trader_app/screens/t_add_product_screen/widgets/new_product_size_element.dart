// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class NewProductSizeElement extends StatelessWidget {
  final String size;
  final VoidCallback onRemove;
  const NewProductSizeElement({
    Key? key,
    required this.size,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      margin: EdgeInsets.only(left: kHPad / 2),
      onLongPress: onRemove,
      onTap: () {
        showSnackBar(
          context: context,
          message: 'اضغط مطولا للحذف',
        );
      },
      alignment: Alignment.center,
      width: ultraLargeIconSize,
      height: ultraLargeIconSize,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kTraderSecondaryColor.withOpacity(.4),
        ),
      ),
      child: Text(
        size.toUpperCase(),
        style: h3TextStyle.copyWith(
          color: kTraderSecondaryColor,
        ),
      ),
    );
  }
}
