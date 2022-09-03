// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/product_filters/product_filters.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class SearchFiltersButton extends StatelessWidget {
  const SearchFiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      padding: EdgeInsets.zero,
      borderRadius: 0,
      backgroundColor: Colors.transparent,
      onTap: () {
        //! you have other show.... functions you can try them
        //! showBottomSheet
        showModalBottomSheet(
          context: context,
          builder: (ctx) => ProductFiltersModal(),
          backgroundColor: Colors.transparent,
        );
      },
      child: PaddingWrapper(
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 3,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: kSecondaryColor,
          ),
          borderRadius: BorderRadius.circular(smallBorderRadius),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/filter.png',
              width: smallIconSize,
              color: kSecondaryColor,
            ),
            HSpace(factor: .4),
            Text(
              'حدد بحثك',
              style: h3InactiveTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
