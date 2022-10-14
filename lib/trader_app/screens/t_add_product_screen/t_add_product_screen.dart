// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/add_product_props.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/check_box_with_period_picker.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/important_product_info.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/new_product_color_element.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/new_product_size_element.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/price_old_new.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/product_images.dart';
import 'package:project/trader_app/utils/add_product_utils.dart';
import 'package:project/utils/general_utils.dart';

enum PickedDateType {
  offerDate,
  trendDate,
}

class TAddProductScreen extends StatefulWidget {
  static const String routeName = '/t-add-product-screen';
  const TAddProductScreen({super.key});

  @override
  State<TAddProductScreen> createState() => _TAddProductScreenState();
}

class _TAddProductScreenState extends State<TAddProductScreen> {
  //? texts controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescController = TextEditingController();
  TextEditingController oldPriceController = TextEditingController();
  TextEditingController currentPriceController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  // TextEditingController discountController = TextEditingController();

  //? product images
  List<File> imagesFiles = [];
  void addProductImage(File imageFile) {
    setState(() {
      imagesFiles.add(imageFile);
    });
  }

  void removeProductImage(File imageFile) {
    setState(() {
      imagesFiles.remove(imageFile);
    });
  }

  //? product colors
  List<Color> availableColors = [];
  void addColor(Color color) {
    setState(() {
      availableColors.add(color);
    });
  }

  void removeColor(Color color) {
    setState(() {
      availableColors.remove(color);
    });
  }

  //? product sizes
  List<Sizes> availableSizes = [];
  void addSize(Sizes size) {
    setState(() {
      availableSizes.add(size);
    });
  }

  void removeSize(Sizes size) {
    setState(() {
      availableSizes.remove(size);
    });
  }

  //? is offer, offer end
  bool isOffer = false;
  void toggleOffer() {
    setState(() {
      isOffer = !isOffer;
    });
    if (isOffer == true && offerEnd == null) {
      handleDatePicker(PickedDateType.offerDate);
    }
    if (oldPriceController.text.isEmpty && isOffer) {
      showSnackBar(
        context: context,
        message: 'قم بكتابة السعر القديم',
      );
    }
  }

  DateTime? offerEnd;
  void setOfferEnd(DateTime d) {
    setState(() {
      offerEnd = d;
      isOffer = true;
    });
    if (oldPriceController.text.isEmpty && isOffer) {
      showSnackBar(
        context: context,
        message: 'قم بكتابة السعر القديم',
      );
    }
  }

  //? is trend, trend end
  bool isTrend = false;
  void toggleTrend() {
    setState(() {
      isTrend = !isTrend;
    });
    if (isTrend == true && trendEnd == null) {
      handleDatePicker(PickedDateType.trendDate);
    }
  }

  DateTime? trendEnd;
  void setTrendEnd(DateTime d) {
    setState(() {
      trendEnd = d;
      isTrend = true;
    });
  }

  //? for handling date pickers
  void handleDatePicker(PickedDateType pickedDateType) async {
    DateTime initialDate = pickedDateType == PickedDateType.offerDate
        ? offerEnd ?? DateTime.now()
        : trendEnd ?? DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (pickedDate == null) return;
    if (pickedDateType == PickedDateType.offerDate) {
      setOfferEnd(pickedDate);
    } else {
      setTrendEnd(pickedDate);
    }
  }

//? for validating the product data
  void validateProductData() {
    //* validating the product name
    if (nameController.text.length < 5) {
      return showSnackBar(
        context: context,
        message: 'لا يقل اسم المنتج عن 5 أحرف',
        snackBarType: SnackBarType.error,
      );
    }
    //* short desc
    if (shortDescController.text.length < 5) {
      return showSnackBar(
        context: context,
        message: 'لا يقل الوصف القصير عن 5 أحرف',
        snackBarType: SnackBarType.error,
      );
    }
    //* product images
    if (imagesFiles.isEmpty) {
      return showSnackBar(
        context: context,
        message: 'لابد من إضافة صورة علي الأقل',
        snackBarType: SnackBarType.error,
      );
    }
    if (!((double.tryParse(currentPriceController.text) ?? 0) > 0)) {
      return showSnackBar(
        context: context,
        message: 'لابد من ادخال سعر المنتج الحالي',
        snackBarType: SnackBarType.error,
      );
    }
    //* old price
    if (oldPriceController.text.isNotEmpty &&
        double.tryParse(oldPriceController.text) == null) {
      return showSnackBar(
        context: context,
        message: 'أدخل سعر قديم صحيح',
        snackBarType: SnackBarType.error,
      );
    }
    //* validating old price
    if (isOffer && oldPriceController.text.isEmpty) {
      return showSnackBar(
        context: context,
        message: 'لابد من إدخال السعر قبل الخصم',
        snackBarType: SnackBarType.error,
      );
    }
    //* upload the product successfully
    showSnackBar(
        context: context,
        message: 'Uploading product',
        snackBarType: SnackBarType.success);
  }

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
                validateProductData();
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
                ImportantProductInfo(
                  name: nameController,
                  shortDesc: shortDescController,
                ),
                VSpace(),
                ProductImages(
                  imagesPaths: imagesFiles,
                  addProductImage: addProductImage,
                  removeProductImage: removeProductImage,
                ),
                VSpace(),
                PriceOldNew(
                  currentPrice: currentPriceController,
                  oldPrice: oldPriceController,
                  // discount: discountController,
                  isOffer: isOffer,
                ),
                VSpace(),
                PaddingWrapper(
                  child: Text(
                    'مواصفات المنتج',
                    style: h2TextStyle.copyWith(color: kTraderBlackColor),
                  ),
                ),
                AddProductProps(
                  title: 'الألوان المتاحة',
                  children: availableColors
                      .map((e) => NewProductColorEelment(
                            color: e,
                            onRemove: () {
                              removeColor(e);
                            },
                          ))
                      .toList(),
                  onAddTapped: () => showAddColorDialog(
                    context: context,
                    addColor: addColor,
                    availableColors: availableColors,
                    removeColor: removeColor,
                  ),
                ),
                VSpace(),
                AddProductProps(
                  title: 'الأحجام المتاحة',
                  children: [
                    ...availableSizes.map(
                      (e) {
                        return NewProductSizeElement(
                          size: e.name,
                          onRemove: () => removeSize(e),
                        );
                      },
                    ),
                  ],
                  onAddTapped: () => showAddSizeDialog(
                    context: context,
                    availableSizes: availableSizes,
                    removeSize: removeSize,
                    addSize: addSize,
                  ),
                ),
                VSpace(),
                PaddingWrapper(
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: brandNameController,
                        title: 'اسم البراند',
                        padding: EdgeInsets.zero,
                        borderColor: kTraderSecondaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.zero,
                      ),
                      VSpace(),
                      CheckBoxWithPeriodPicker(
                        title: 'عرض؟',
                        checked: isOffer,
                        dateEnd: offerEnd,
                        pickDate: () =>
                            handleDatePicker(PickedDateType.offerDate),
                        toggleChecked: toggleOffer,
                      ),
                      VSpace(factor: .5),
                      CheckBoxWithPeriodPicker(
                        title: 'ترند؟',
                        checked: isTrend,
                        dateEnd: trendEnd,
                        pickDate: () =>
                            handleDatePicker(PickedDateType.trendDate),
                        toggleChecked: toggleTrend,
                      ),
                    ],
                  ),
                ),

                //! just delete me after finishing

                VSpace(factor: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'عند الانتهاء قم برفع المنتج من الزر بالأعلي',
                      style: h4TextStyleInactive.copyWith(
                        color: kTraderSecondaryColor,
                      ),
                    ),
                    HSpace(factor: .1),
                    Image.asset(
                      'assets/icons/upload.png',
                      width: smallIconSize,
                      color: kTraderSecondaryColor,
                    ),
                  ],
                ),
                VSpace(factor: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
