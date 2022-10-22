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
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/products_control_provider.dart';
import 'package:project/trader_app/screens/t_add_offer_screen/widgets/customer_number_picker.dart';
import 'package:project/trader_app/screens/t_choose_single_product_screen/t_choose_single_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TAddOfferScreen extends StatefulWidget {
  static const String routeName = 't-add-offer-screen';
  const TAddOfferScreen({super.key});

  @override
  State<TAddOfferScreen> createState() => _TAddOfferScreenState();
}

class _TAddOfferScreenState extends State<TAddOfferScreen> {
  bool loading = false;
  double discountValue = 10;
  String? discountError;
  TextEditingController discountController = TextEditingController();
  TextEditingController offerTitleController = TextEditingController();
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

  //? validate other inputs
  bool validateOtherInputs() {
    if (productModel == null) {
      showSnackBar(
        context: context,
        message: 'قم باختيار المنتج أولا',
        snackBarType: SnackBarType.error,
      );
      return false;
    }
    if (hours == 0 && days == 0 && months == 0) {
      showSnackBar(
        context: context,
        message: 'قم بتعديل مدة العرض',
        snackBarType: SnackBarType.error,
      );
      return false;
    }
    return true;
  }

//? to send the offer data to be created
  Future<void> handleCreateOffer() async {
    if (!validateDiscountField()) {
      return;
    }
    if (!validateOtherInputs()) {
      return;
    }

    if (loading) {
      showSnackBar(context: context, message: 'already uploading');
      return;
    }
    try {
      setState(() {
        loading = true;
      });
      OfferModel offerModel =
          await Provider.of<StoreProvider>(context, listen: false).addOffer(
        discountPercentage: discountValue / 100,
        endAt: offerEndDate(),
        imagePath: productModel!.imagesPath.first,
        productId: productModel!.id,
        productName: productModel!.name,
        storeId: productModel!.storeId,
        title: offerTitleController.text,
      );
      //* edit product
      var productsProvider =
          Provider.of<ProductsProvider>(context, listen: false);
      ProductModel newProduct = productModel!;
      newProduct.offerId = offerModel.id;

      await Provider.of<ProductsControlProvider>(context, listen: false)
          .editProduct(newProduct, productsProvider);

      setState(() {
        loading = false;
      });
      showSnackBar(
        context: context,
        message: 'تم انشاء العرض بنجاح',
        snackBarType: SnackBarType.success,
      );
      Navigator.pop(context);
    } catch (e) {
      showSnackBar(
        context: context,
        message: e.toString(),
        snackBarType: SnackBarType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                      ? NoProductChosen(setProductModel: setProductModel)
                      : ProductChosen(
                          productModel: productModel!,
                          setProductModel: setProductModel,
                        ),
                  VSpace(),
                  CustomTextField(
                    title: 'عنوان قصير للعرض',
                    borderRadius: BorderRadius.zero,
                    borderColor: kTraderSecondaryColor,
                    controller: offerTitleController,
                    textInputAction: TextInputAction.done,
                    padding: EdgeInsets.zero,
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
              divisions: 100,
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
            ),
            VSpace(),
          ],
        ),
      ),
    );
  }

  setProductModel(p) {
    setState(() {
      productModel = p;
    });
  }

  DateTime offerEndDate() {
    // return DateTime(
    //   DateTime.now().year,
    //   DateTime.now().month,
    //   DateTime.now().day,
    // ).add(
    //   Duration(
    //     hours: hours,
    //     days: days + months * 30,
    //   ),
    // );
    return DateTime.now().add(
      Duration(
        hours: hours,
        days: days + months * 30,
      ),
    );
  }
}

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

class ProductChosen extends StatelessWidget {
  final ProductModel productModel;
  final Function(ProductModel p) setProductModel;
  const ProductChosen({
    super.key,
    required this.productModel,
    required this.setProductModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اضغط مطولا للتغيير',
          style: h4TextStyleInactive.copyWith(
            color: kTraderSecondaryColor.withOpacity(.8),
          ),
        ),
        TraderProductCard(
          productModel: productModel,
          onLongPressed: () async {
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
        ),
      ],
    );
  }
}

class OfferDatePicker extends StatelessWidget {
  final int hours;
  final int days;
  final int months;
  final Function(int hours) setHours;
  final Function(int days) setDays;
  final Function(int months) setMonths;
  const OfferDatePicker({
    super.key,
    required this.hours,
    required this.days,
    required this.months,
    required this.setHours,
    required this.setDays,
    required this.setMonths,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomNumberPicker(
          onChanged: setHours,
          maxValue: 24,
          minValue: 0,
          value: hours,
          title: 'ساعة',
        ),
        CustomNumberPicker(
          onChanged: setDays,
          maxValue: 29,
          minValue: 0,
          value: days,
          title: 'يوم',
        ),
        CustomNumberPicker(
          onChanged: setMonths,
          maxValue: 5 * 12,
          minValue: 0,
          value: months,
          title: 'شهر',
        ),
      ],
    );
  }
}
