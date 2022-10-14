// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
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
  bool isOffer = true;
  void toggleOffer() {
    setState(() {
      isOffer = !isOffer;
    });
    if (isOffer == true && offerEnd == null) {
      handleDatePicker();
    }
  }

  DateTime? offerEnd = DateTime(2022, 10, 30);
  void setOfferEnd(DateTime d) {
    setState(() {
      offerEnd = d;
      isOffer = true;
    });
  }

  //? is trend, trend end
  bool isTrend = false;
  void toggleTrend() {
    setState(() {
      isTrend = !isTrend;
    });
    if (isTrend == true && trendEnd == null) {
      handleDatePicker();
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
  void handleDatePicker() {
    print('picking date then returning it where its needed');
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
                showSnackBar(
                    context: context,
                    message: 'Upload product will be here soon',
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
                        pickDate: handleDatePicker,
                        toggleChecked: toggleOffer,
                      ),
                      VSpace(factor: .5),
                      CheckBoxWithPeriodPicker(
                        title: 'ترند؟',
                        checked: isTrend,
                        dateEnd: trendEnd,
                        pickDate: handleDatePicker,
                        toggleChecked: toggleTrend,
                      ),
                    ],
                  ),
                ),

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
