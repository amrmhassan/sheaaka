// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_choose_single_product_screen/t_choose_single_product_screen.dart';
import 'package:project/utils/general_utils.dart';

class NoProductChosen extends StatelessWidget {
  final Function(ProductModel p) setProductModel;
  const NoProductChosen({super.key, required this.setProductModel});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onTap: () async {
                ProductModel? p = await Navigator.pushNamed(
                  context,
                  TChooseSingleProductsScreen.routeName,
                ) as ProductModel?;
                if (p != null) {
                  setProductModel(p);
                } else {
                  showSnackBar(context: context, message: 'لم يتم اختيار منتج');
                }
              },
              borderRadius: 0,
              backgroundColor: kTraderPrimaryColor,
              child: Text(
                'اختيار منتج',
                style: h3LiteTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
