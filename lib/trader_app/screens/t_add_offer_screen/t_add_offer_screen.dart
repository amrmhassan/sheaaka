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
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/customer_number_picker.dart';
import 'package:project/trader_app/screens/t_choose_single_product_screen/t_choose_single_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:project/utils/general_utils.dart';

class TAddOfferScreen extends StatefulWidget {
  static const String routeName = 't-add-offer-screen';
  const TAddOfferScreen({super.key});

  @override
  State<TAddOfferScreen> createState() => _TAddOfferScreenState();
}

class _TAddOfferScreenState extends State<TAddOfferScreen> {
  double discountValue = 10;
  String? discountError;
  TextEditingController discountController = TextEditingController();
  ProductModel? productModel;

  //? date data
  int hours = 0;
  int days = 0;
  int months = 0;

//? validate the discount text field
  bool validateDiscountField() {
    double? value = double.tryParse(discountController.text);
    //* catching empty discount
    if (discountController.text.isEmpty) {
      setState(() {
        discountError = 'لا يمكن أن يكون فارغا';
      });
      return false;
    }
    if (value == null) {
      setState(() {
        discountError = 'من فضلك أدخل رقما';
      });
      return false;
    }
    if (value < 1) {
      setState(() {
        discountError = 'لا يمكن أن يكون الخصم أصغر من 1%';
      });
      return false;
    }
    if (value > 100) {
      setState(() {
        discountError = 'لا يمكن أن يكون الخصم أكبر من 100%';
      });
      return false;
    }
    setState(() {
      discountError = null;
    });
    return true;
  }

//? to send the offer data to be created
  Future<void> handleCreateOffer() async {
    if (!validateDiscountField()) {
      return;
    }
    showSnackBar(
      context: context,
      message: 'done',
      snackBarType: SnackBarType.success,
    );
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
            title: 'عرض جديد',
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
                    ? Column(
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
                                          TChooseSingleProductsScreen.routeName)
                                      as ProductModel?;
                                  if (p != null) {
                                    setState(() {
                                      productModel = p;
                                    });
                                  } else {
                                    showSnackBar(
                                        context: context,
                                        message: 'لم يتم اختيار منتج');
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
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'اضغط مطولا للتغيير',
                            style: h4TextStyleInactive.copyWith(
                              color: kTraderSecondaryColor.withOpacity(.8),
                            ),
                          ),
                          TraderProductCard(
                            productModel: productModel!,
                            onLongPressed: () async {
                              ProductModel? p = await Navigator.pushNamed(
                                context,
                                TChooseSingleProductsScreen.routeName,
                              ) as ProductModel?;
                              if (p != null) {
                                setState(() {
                                  productModel = p;
                                });
                              } else {
                                showSnackBar(
                                    context: context,
                                    message: 'لم يتم اختيار منتج');
                              }
                            },
                          ),
                        ],
                      ),
                VSpace(),
                Row(
                  children: [
                    Text(
                      'مدة العرض',
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
                    CustomNumberPicker(
                      onChanged: (v) {
                        setState(() {
                          hours = v;
                        });
                      },
                      maxValue: 24,
                      minValue: 0,
                      value: hours,
                      title: 'ساعة',
                    ),
                    CustomNumberPicker(
                      onChanged: (v) {
                        setState(() {
                          days = v;
                        });
                      },
                      maxValue: 29,
                      minValue: 0,
                      value: days,
                      title: 'يوم',
                    ),
                    CustomNumberPicker(
                      onChanged: (v) {
                        setState(() {
                          months = v;
                        });
                      },
                      maxValue: 5 * 12,
                      minValue: 0,
                      value: months,
                      title: 'شهر',
                    ),
                  ],
                ),
                VSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'سيتم الانتهاء في',
                      style: h3TextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                    Text(
                      dateToString(
                        offerEndDate(),
                      ),
                      style: h3TextStyle.copyWith(
                        color: kTraderBlackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VSpace(factor: 2),
          CustomTextField(
            title: 'قيمة خصم العرض',
            errorText: discountError,
            borderRadius: BorderRadius.zero,
            borderColor: kTraderSecondaryColor,
            controller: discountController,
            requiredField: true,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
            onChange: (v) {
              if (!validateDiscountField()) {
                return;
              }
              setState(() {
                discountValue = double.parse(v);
              });
            },
            trailingIcon: Image.asset(
              'assets/icons/percentage.png',
              width: ultraSmallIconSize,
              color: kTraderPrimaryColor,
            ),
          ),
          Slider(
            min: 0,
            max: 100,
            thumbColor: kTraderPrimaryColor,
            activeColor: kTraderPrimaryColor,
            inactiveColor: kTraderPrimaryColor.withOpacity(.3),
            value: discountValue,
            onChanged: (value) {
              setState(() {
                discountValue = value;
                if (discountError != null) {
                  discountError = null;
                }
              });
              discountController.text = value.toStringAsFixed(0);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWrapper(
                onTap: handleCreateOffer,
                padding: EdgeInsets.symmetric(
                  horizontal: kHPad,
                  vertical: kVPad / 2,
                ),
                borderRadius: 0,
                backgroundColor: kTraderPrimaryColor,
                child: Text(
                  'إنشاء',
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
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      Duration(
        hours: hours,
        days: days + months * 30,
      ),
    );
  }
}
