// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';

class OriginalPrice extends StatelessWidget {
  final TextEditingController originalPrice;
  // final TextEditingController discount;
  final bool isOffer;

  const OriginalPrice({
    Key? key,
    required this.originalPrice,
    // required this.discount,
    required this.isOffer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'السعر الأصلي',
                style: h2TextStyle.copyWith(
                  color: kTraderBlackColor,
                ),
              ),
            ],
          ),
          VSpace(factor: .5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomTextField(
                  textInputType: TextInputType.number,
                  requiredField: true,
                  controller: originalPrice,
                  title: 'الأصلي',
                  padding: EdgeInsets.zero,
                  borderColor: kTraderSecondaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
