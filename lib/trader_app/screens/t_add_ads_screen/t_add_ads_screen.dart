// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/cart_screen/widgets/product_cart_price.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class TAddAdsScreen extends StatelessWidget {
  static const String routeName = 't-add-offer-screen';
  const TAddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            traderStyle: true,
            rightTitle: true,
            title: 'إنشاء إعلان',
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          PaddingWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'لابد من اختيار منتج',
                  style: h4TextStyleInactive.copyWith(
                    color: kTraderBlackColor,
                  ),
                ),
                VSpace(factor: .5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWrapper(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHPad,
                        vertical: kVPad / 2,
                      ),
                      onTap: () {},
                      borderRadius: 0,
                      backgroundColor: kTraderPrimaryColor,
                      child: Text(
                        'اختيار منتج',
                        style: h3LiteTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonWrapper(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHPad,
                        vertical: kVPad / 2,
                      ),
                      onTap: () {},
                      borderRadius: 0,
                      backgroundColor: kTraderPrimaryColor,
                      child: Text(
                        'إنشاء عرض؟',
                        style: h3LiteTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                VSpace(),
                Row(
                  children: [
                    Text(
                      'مدة الإعلان',
                      style: h3TextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                    HSpace(factor: .5),
                    Text(
                      'قم بالضغط للتعديل',
                      style: h4TextStyleInactive.copyWith(
                        color: kTraderSecondaryColor,
                      ),
                    ),
                  ],
                ),
                VSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTimePicker(
                      title: 'ساعة',
                      value: 0,
                    ),
                    HSpace(
                      factor: 2,
                    ),
                    CustomTimePicker(
                      title: 'يوم',
                      value: 0,
                    ),
                    HSpace(
                      factor: 2,
                    ),
                    CustomTimePicker(
                      title: 'شهر',
                      value: 0,
                    ),
                  ],
                ),
                VSpace(factor: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'سعر المنتج',
                      style: h4TextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                    ProductCartPrice(
                      price: 20,
                      color: kTraderBlackColor,
                      fontSize: h4TextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                HLine(
                  color: kTraderSecondaryColor.withOpacity(.2),
                ),
              ],
            ),
          ),
          VSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWrapper(
                onTap: () {},
                padding: EdgeInsets.symmetric(
                  horizontal: kHPad,
                  vertical: kVPad / 2,
                ),
                borderRadius: 0,
                backgroundColor: kTraderPrimaryColor,
                child: Text(
                  'الاستمرار',
                  style: h3LiteTextStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomTimePicker extends StatelessWidget {
  final int value;
  final String title;

  const CustomTimePicker({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: h1TextStyle.copyWith(
            color: kTraderBlackColor,
          ),
        ),
        Text(
          title,
          style: h1TextStyle.copyWith(
            color: kTraderBlackColor,
            height: 1,
          ),
        ),
      ],
    );
  }
}
