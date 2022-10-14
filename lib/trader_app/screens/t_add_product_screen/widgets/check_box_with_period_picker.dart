// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_checkbox.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class CheckBoxWithPeriodPicker extends StatelessWidget {
  final String title;
  final bool checked;
  final DateTime? dateEnd;
  final VoidCallback toggleChecked;
  final VoidCallback pickDate;

  const CheckBoxWithPeriodPicker({
    Key? key,
    required this.title,
    required this.checked,
    required this.dateEnd,
    required this.pickDate,
    required this.toggleChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCartCheckBox(
          checked: checked,
          onTap: toggleChecked,
        ),
        HSpace(factor: .5),
        Text(
          title,
          style: h3LiteTextStyle.copyWith(
            color: kTraderBlackColor,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: pickDate,
          child: Text(
            checked && dateEnd != null
                ? dateToString(dateEnd!)
                : 'مدة الانتهاء',
            style: h3TextStyle.copyWith(
              color: kTraderPrimaryColor,
            ),
          ),
        )
      ],
    );
  }
}
