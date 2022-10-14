// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';

class PriceOldNew extends StatelessWidget {
  final TextEditingController oldPrice;
  final TextEditingController currentPrice;
  // final TextEditingController discount;
  final bool isOffer;

  const PriceOldNew({
    Key? key,
    required this.currentPrice,
    required this.oldPrice,
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
                'السعر',
                style: h2TextStyle.copyWith(
                  color: kTraderBlackColor,
                ),
              ),
              HSpace(factor: .5),
              Text(
                'عند إضافة سعر قديم سيتم اعتبار المنتج كعرض',
                style: h4TextStyleInactive.copyWith(
                  color: kTraderSecondaryColor.withOpacity(.5),
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
                  controller: currentPrice,
                  title: 'الحالي',
                  padding: EdgeInsets.zero,
                  borderColor: kTraderSecondaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.zero,
                ),
              ),
              if (isOffer)
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      HSpace(factor: .3),
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          textInputType: TextInputType.number,
                          title: 'القديم',
                          controller: oldPrice,
                          padding: EdgeInsets.zero,
                          borderColor: kTraderSecondaryColor.withOpacity(.5),
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      Spacer(),
                      // HSpace(factor: .3),
                      // Expanded(
                      //   child: CustomTextField(
                      //     textInputType: TextInputType.number,
                      //     title: '0%-',
                      //     controller: discount,
                      //     padding: EdgeInsets.zero,
                      //     borderColor: kTraderSecondaryColor.withOpacity(.5),
                      //     borderRadius: BorderRadius.zero,
                      //   ),
                      // ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
