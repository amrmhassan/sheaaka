// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/products_control_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/add_product_props.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/adding_product_advice.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/check_box_with_period_picker.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/important_product_info.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/new_product_color_element.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/new_product_size_element.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/price_old_new.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/product_images.dart';
import 'package:project/trader_app/utils/add_product_utils.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

enum PickedDateType {
  offerDate,
  trendDate,
}

enum AddProductMode {
  add,
  edit,
}

class TAddProductScreen extends StatefulWidget {
  static const String routeName = '/t-add-product-screen';
  const TAddProductScreen({super.key});

  @override
  State<TAddProductScreen> createState() => _TAddProductScreenState();
}

class _TAddProductScreenState extends State<TAddProductScreen> {
  //? open mode
  AddProductMode openMode = AddProductMode.add;
  //? edited product additional data
  String? editedProductId;
  DateTime? editedProductCreatedAt;
  int? editedProductLovesNumber;
  String? editedProductBrandId;

  //? full desc
  String fullDesc = '';
  void setFullDesc(String v) {
    setState(() {
      fullDesc = v;
    });
  }

  //? texts controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController shortDescController = TextEditingController();
  TextEditingController originalPriceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController offerNameController = TextEditingController();
  TextEditingController keywordsController = TextEditingController();

  //? product images files
  List<Object> images = [];
  void addProductImage(File imageFile) {
    setState(() {
      images.add(imageFile);
    });
  }

  void removeProductImage(dynamic image) {
    setState(() {
      images.remove(image);
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
    if (originalPriceController.text.isEmpty && isOffer) {
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
    if (originalPriceController.text.isEmpty && isOffer) {
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
    if (pickedDate == null) {
      if (offerEnd == null) {
        setState(() {
          isOffer = false;
        });
      }
      return;
    }
    if (pickedDateType == PickedDateType.offerDate) {
      setOfferEnd(pickedDate);
    } else {
      setTrendEnd(pickedDate);
    }
  }

//? for validating the product data
  Future<void> validateProductData() async {
    double calcedOfferPrice = double.tryParse(offerPriceController.text) ?? 0;
    double calcedOriginalPrice =
        double.tryParse(originalPriceController.text) ?? 0;
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
    if (images.isEmpty) {
      return showSnackBar(
        context: context,
        message: 'لابد من إضافة صورة علي الأقل',
        snackBarType: SnackBarType.error,
      );
    }
    //* offer price
    if (!(calcedOfferPrice > 0) && isOffer) {
      return showSnackBar(
        context: context,
        message: 'لابد من ادخال سعر المنتج الحالي',
        snackBarType: SnackBarType.error,
      );
    }
    //* original price
    if (!(calcedOriginalPrice > 0)) {
      return showSnackBar(
        context: context,
        message: 'أدخل سعر قديم صحيح',
        snackBarType: SnackBarType.error,
      );
    }

    //* validating that old price is bigger than price after offer
    if (isOffer &&
        (double.parse(originalPriceController.text) <=
            double.parse(offerPriceController.text))) {
      return showSnackBar(
        context: context,
        message: 'لابد أن يكون السعر الأصلي أكبر من سعر العرض',
        snackBarType: SnackBarType.error,
      );
    }
    if (isOffer && offerNameController.text.length < 3) {
      return showSnackBar(
        context: context,
        message: 'لا يقل اسم العرض عن 3 أحرف',
        snackBarType: SnackBarType.error,
      );
    }
    //* upload the product successfully
    StoreModel myStore =
        Provider.of<TraderProvider>(context, listen: false).myStore!;
    ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    StoreProvider storeProvider =
        Provider.of<StoreProvider>(context, listen: false);

    Provider.of<ProductsControlProvider>(context, listen: false).uploadProduct(
      nameController: nameController,
      myStore: myStore,
      imagesFiles: images,
      offerPriceController: offerPriceController,
      availableColors: availableColors,
      availableSizes: availableSizes,
      brandNameController: brandNameController,
      shortDescController: shortDescController,
      originalPriceController: originalPriceController,
      context: context,
      fullDesc: fullDesc,
      isOffer: isOffer,
      offerEnd: offerEnd,
      productsProvider: productsProvider,
      offerNameController: offerNameController,
      keywordksController: keywordsController,
      storeProvider: storeProvider,
      addProductMode: openMode,
      editedProductId: editedProductId,
      editedProductCreatedAt: editedProductCreatedAt,
      editedProductLovesNumber: editedProductLovesNumber,
      editedProductBrandId: editedProductBrandId,
    );
    Navigator.pop(context);
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      ProductModel? productModel =
          ModalRoute.of(context)?.settings.arguments as ProductModel?;
      if (productModel != null) {
        openMode = AddProductMode.edit;
        //? here set the edited product data
        editedProductId = productModel.id;
        nameController.text = productModel.name;
        shortDescController.text = productModel.shortDesc ?? '';
        keywordsController.text = productModel.keywords?.join('\n') ?? '';
        fullDesc = productModel.fullDesc ?? '';
        images = [...productModel.imagesPath];
        originalPriceController.text = doubleToString(productModel.price);
        availableColors = productModel.availableColors ?? [];
        availableSizes = productModel.availableSize ?? [];
        brandNameController.text = productModel.brand?.name ?? '';
        editedProductCreatedAt = productModel.createdAt;
        editedProductLovesNumber = productModel.lovesNumber;
        editedProductBrandId = productModel.brand?.id;

        setState(() {});
      }
    });
    super.initState();
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
                saveChangesIcon,
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
                  keywords: keywordsController,
                  name: nameController,
                  shortDesc: shortDescController,
                  fullDesc: fullDesc,
                  setFullDesc: setFullDesc,
                ),
                VSpace(),
                ProductImages(
                  imagesPaths: images,
                  addProductImage: addProductImage,
                  removeProductImage: removeProductImage,
                ),
                VSpace(),
                OriginalPrice(
                  originalPrice: originalPriceController,
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
                      if (openMode == AddProductMode.add)
                        Column(
                          children: [
                            CheckBoxWithPeriodPicker(
                              title: 'عرض؟',
                              checked: isOffer,
                              dateEnd: offerEnd,
                              pickDate: () =>
                                  handleDatePicker(PickedDateType.offerDate),
                              toggleChecked: toggleOffer,
                            ),
                            VSpace(factor: .3),
                            if (isOffer)
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextField(
                                      requiredField: true,
                                      controller: offerNameController,
                                      title: 'اسم العرض',
                                      padding: EdgeInsets.zero,
                                      borderColor:
                                          kTraderSecondaryColor.withOpacity(.5),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  HSpace(factor: .3),
                                  Expanded(
                                    child: CustomTextField(
                                      requiredField: true,
                                      textInputType: TextInputType.number,
                                      title: 'سعر العرض',
                                      controller: offerPriceController,
                                      padding: EdgeInsets.zero,
                                      borderColor:
                                          kTraderSecondaryColor.withOpacity(.5),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                  ),
                                  // HSpace(factor: .3),
                                  // Expanded(
                                  //   child: CustomTextField(
                                  //     textInputType: TextInputType.number,
                                  //     title: '0%-',
                                  //     controller: discount,
                                  //     padding: EdgeInsets.zero,
                                  //     borderColor: kTraderSecondaryColor.withOpacity(.5),
                                  //     borderRadius: BorderRadius.zero,
                                  //   ),
                                  // ),
                                ],
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
                            //! just delete me after finishing
                            VSpace(factor: 2),
                          ],
                        ),
                    ],
                  ),
                ),
                AddingProductAdvice(
                  iconPath: saveChangesIcon,
                ),
                VSpace(factor: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String get saveChangesIcon =>
      'assets/icons/${openMode == AddProductMode.add ? 'upload1' : 'save'}.png';
}
