// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';

class ChooseProductAppBar extends StatelessWidget {
  final List<ProductModel> selectedProducts;
  final bool uploadActive;

  const ChooseProductAppBar({
    Key? key,
    required this.selectedProducts,
    required this.uploadActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        VSpace(),
        SizedBox(width: double.infinity),
        PaddingWrapper(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Column(
                children: [
                  SizedBox(width: double.infinity),
                  Text(
                    'اختر منتج',
                    style: h2TextStyle.copyWith(
                      color: kTraderBlackColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: uploadActive ? 1 : .5,
                    child: AppBarIcon(
                      backgroundColor: kTraderLightColor.withOpacity(.5),
                      onTap: uploadActive
                          ? () {
                              Navigator.pop(context, selectedProducts);
                            }
                          : () {},
                      iconName: 'check',
                    ),
                  ),
                  AppBarIcon(
                    backgroundColor: kTraderLightColor.withOpacity(.5),
                    onTap: () {
                      Navigator.pop(context, null);
                    },
                    iconName: 'close',
                  ),
                ],
              ),
            ],
          ),
        ),
        VSpace(),
      ],
    );
  }
}
