import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/models/types.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/utils/general_utils.dart';

class TProductsScreenAppBar extends StatelessWidget {
  const TProductsScreenAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'المنتجات',
      traderStyle: true,
      rightIcon: AppBarIcon(
        onTap: () {
          showSnackBar(
              context: context,
              message: 'Search will be here soon',
              snackBarType: SnackBarType.info);
        },
        backgroundColor: kTraderLightColor.withOpacity(.5),
        child: Image.asset(
          'assets/icons/search1.png',
          width: mediumIconSize,
          color: kTraderBlackColor,
        ),
      ),
    );
  }
}
