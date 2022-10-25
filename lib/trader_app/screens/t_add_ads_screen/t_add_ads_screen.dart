// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
import 'package:project/trader_app/screens/t_add_ads_screen/widgets/ads_price.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/no_product_chosen.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/offer_date_picker.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/product_chosen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TAddAdsScreen extends StatefulWidget {
  static const String routeName = 't-add-ads-screen';
  const TAddAdsScreen({super.key});

  @override
  State<TAddAdsScreen> createState() => _TAddAdsScreenState();
}

class _TAddAdsScreenState extends State<TAddAdsScreen> {
  bool loading = false;
  ProductModel? productModel;
  bool addClicked = false;

  //? date data
  int hours = 0;
  int days = 0;
  int months = 0;

  Future<void> handleCreateTrend() async {
    //* validating choosing product
    if (productModel == null) {
      return showSnackBar(
        context: context,
        message: 'قم باختيار منتج أولا',
        snackBarType: SnackBarType.error,
      );
    }

    //* validating ads end
    if (hours == 0 && days == 0 && months == 0) {
      return showSnackBar(
        context: context,
        message: 'قم بتحديد مدة الاعلان',
        snackBarType: SnackBarType.error,
      );
    }

    //* creating the ads
    try {
      setState(() {
        addClicked = true;
      });
      await Provider.of<AdsProvider>(context, listen: false).createAds(
        endDate: offerEndDate(),
        imagePath: productModel!.imagesPath.first,
        productName: productModel!.name,
        storeId: productModel!.storeId,
        storeLogo: productModel!.storeLogo,
        storeName: productModel!.storeName,
      );
      showSnackBar(
        context: context,
        message: 'تم انشاء الاعلان',
        snackBarType: SnackBarType.success,
      );
      Navigator.pop(context);
    } catch (e) {
      showSnackBar(
          context: context,
          message: e.toString(),
          snackBarType: SnackBarType.error);
    }
  }

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
                productModel == null
                    ? NoProductChosen(setProductModel: setProductModel)
                    : ProductChosen(
                        productModel: productModel!,
                        setProductModel: setProductModel,
                      ),
                // VSpace(),
                // ButtonWrapper(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: kHPad,
                //     vertical: kVPad / 2,
                //   ),
                //   onTap: () {},
                //   borderRadius: 0,
                //   backgroundColor: kTraderPrimaryColor,
                //   child: Text(
                //     'إنشاء عرض؟',
                //     style: h3LiteTextStyle.copyWith(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
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
                      'قم بالسحب لأسفل وأعلي',
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
                    OfferDatePicker(
                        hours: hours,
                        days: days,
                        months: months,
                        setHours: (h) {
                          setState(() {
                            hours = h;
                          });
                        },
                        setDays: (d) {
                          setState(() {
                            days = d;
                          });
                        },
                        setMonths: (m) {
                          setState(() {
                            months = m;
                          });
                        }),
                  ],
                ),
                VSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'سيتم الانتهاء في',
                      style: h3LiteTextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                    Text(
                      dateToString(
                        offerEndDate(),
                      ),
                      style: h3LiteTextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                  ],
                ),
                VSpace(),
                if (productModel != null)
                  AdsPrice(
                    productDiscount: productModel!.discount,
                    productPrice: productModel!.price,
                    endDate: offerEndDate(),
                  ),
              ],
            ),
          ),
          VSpace(),
          if (!addClicked)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWrapper(
                  onTap: handleCreateTrend,
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

  DateTime offerEndDate() {
    return DateTime.now().add(
      Duration(
        hours: hours,
        days: days + months * 30,
      ),
    );
  }

  setProductModel(ProductModel p) {
    setState(() {
      productModel = p;
    });
  }
}
