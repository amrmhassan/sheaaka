// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/add_product_photo_button.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/price_old_new.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/product_image_uploaded.dart';
import 'package:project/utils/general_utils.dart';

class TAddProductScreen extends StatelessWidget {
  static const String routeName = '/t-add-product-screen';
  const TAddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'إضافة منتج',
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
                'assets/icons/upload1.png',
                width: mediumIconSize,
                color: kTraderBlackColor,
              ),
            ),
          ),
          VSpace(),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                PaddingWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        requiredField: true,
                        title: 'اسم المنتج',
                        padding: EdgeInsets.zero,
                        borderColor: kTraderSecondaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.zero,
                      ),
                      VSpace(),
                      CustomTextField(
                        requiredField: true,
                        title: 'وصف قصير',
                        padding: EdgeInsets.zero,
                        borderColor: kTraderSecondaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.zero,
                      ),
                      Text(
                        'إضافة وصف مفصل',
                        style: h3TextStyle.copyWith(
                            color: kTraderPrimaryColor,
                            decoration: TextDecoration.underline),
                      ),
                      VSpace(),
                      CustomTextField(
                        title: 'إضافة كلمات مفتاحية',
                        padding: EdgeInsets.zero,
                        borderColor: kTraderSecondaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.zero,
                      ),
                      VSpace(),
                      Text('إضافة صور للمنتج'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HSpace(),
                      ProductImageUploaded(),
                      ...[
                        // uploaded image products will be here
                      ],
                      AddProductPhotoButton(),
                    ],
                  ),
                ),
                VSpace(),
                PriceOldNew(),
                VSpace(),
                AddAvailableColors(),

                //! just delete me after finishing
                VSpace(factor: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddAvailableColors extends StatelessWidget {
  const AddAvailableColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مواصفات المنتج',
                style: h2TextStyle.copyWith(color: kTraderBlackColor),
              ),
              Text(
                'الأولوان المتاحة',
                style: h4TextStyleInactive.copyWith(
                  color: kTraderSecondaryColor,
                ),
              ),
              VSpace(factor: .5),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HSpace(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              AddColorButton(),
              HSpace(),
            ],
          ),
        ),
      ],
    );
  }
}

class AddColorButton extends StatelessWidget {
  const AddColorButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      padding: EdgeInsets.all(largePadding),
      width: ultraLargeIconSize,
      height: ultraLargeIconSize,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kTraderSecondaryColor.withOpacity(.5),
        ),
      ),
      child: Image.asset(
        'assets/icons/plus.png',
        color: kTraderNotifyColor,
      ),
    );
  }
}
