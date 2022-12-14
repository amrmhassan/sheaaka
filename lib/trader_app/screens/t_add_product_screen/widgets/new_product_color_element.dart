// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class NewProductColorEelment extends StatelessWidget {
  final Color color;
  final VoidCallback onRemove;
  const NewProductColorEelment({
    Key? key,
    required this.color,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
        onLongPress: onRemove,
        onTap: () {
          showSnackBar(
            context: context,
            message: 'اضغط مطولا للحذف',
          );
        },
        margin: EdgeInsets.only(left: kHPad / 2),
        padding: EdgeInsets.all(largePadding),
        width: ultraLargeIconSize,
        height: ultraLargeIconSize,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            width: 1,
            color: kTraderSecondaryColor.withOpacity(.6),
          ),
        ),
        child: SizedBox());
  }
}

// Colors.primaries[Random().nextInt(Colors.primaries.length)]