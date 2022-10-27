// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/products_control_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_add_product_screen/t_add_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/t_product_screen_app_bar.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TProductsScreen extends StatefulWidget {
  static const String routeName = '/t-products-screen';

  const TProductsScreen({super.key});

  @override
  State<TProductsScreen> createState() => _TProductsScreenState();
}

class _TProductsScreenState extends State<TProductsScreen> {
  //? showing remove product modal
  void showRemoveProductModal(ProductModel productModel) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return DeleteModal(
            title: 'هل تريد حذف هذا المنتج؟',
            onRemove: () {
              handleRemoveProduct(productModel);
            },
            subTitle: 'سيتم حذف المنتج من جميع الأقسام أيضا',
          );
        });
  }

  //? handle removing a product
  Future<void> handleRemoveProduct(ProductModel productModel) async {
    try {
      await Provider.of<ProductsControlProvider>(context, listen: false)
          .deleteProduct(
        productModel,
        Provider.of<StoreProvider>(context, listen: false),
        Provider.of<ProductsProvider>(context, listen: false),
        Provider.of<TraderProvider>(context, listen: false),
      );
      showSnackBar(
        context: context,
        message: 'تم حذف المنتج',
        snackBarType: SnackBarType.info,
      );
    } catch (e) {
      showSnackBar(
          context: context,
          message: e.toString(),
          snackBarType: SnackBarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var pcp = Provider.of<ProductsControlProvider>(context);
    var traderProvider = Provider.of<TraderProvider>(context, listen: false);
    var storeProducts = Provider.of<ProductsProvider>(context)
        .getStoreProducts(traderProvider.myStore!.id);

    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {
          Navigator.pushNamed(context, TAddProductScreen.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(largePadding),
          child: Image.asset(
            Provider.of<ProductsControlProvider>(context).loading
                ? 'assets/icons/upload.png'
                : 'assets/icons/plus.png',
            color: Colors.white,
          ),
        ),
      ),
      child: Column(
        children: [
          TProductsScreenAppBar(),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(number: storeProducts.length),
          VSpace(factor: .5),
          if (pcp.loading) UploadingProduct(),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: storeProducts.length,
              itemBuilder: (context, index) {
                ProductModel productModel = storeProducts[index];
                return TraderProductCard(
                  productModel: productModel,
                  removeProduct: showRemoveProductModal,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UploadingProduct extends StatelessWidget {
  const UploadingProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: productImageDimensions,
      child: Lottie.asset(
        'assets/animations/upload-edited.json',
      ),
    );
  }
}

class DeleteModal extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback onRemove;
  final VoidCallback? onCancel;

  const DeleteModal({
    Key? key,
    required this.title,
    required this.onRemove,
    this.onCancel,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      onApply: () {},
      showApplyModalButton: false,
      applyButtonTitle: '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text(
            title,
            style: h3TextStyle.copyWith(
              color: kTraderBlackColor,
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle!,
              style: h4TextStyleInactive.copyWith(
                color: kTraderSecondaryColor.withOpacity(.9),
              ),
            ),
          VSpace(),
          Row(
            children: [
              Expanded(
                child: ButtonWrapper(
                  onTap: () {
                    onRemove();
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(vertical: kVPad / 2),
                  backgroundColor: kTraderSecondaryColor.withOpacity(.2),
                  child: Text(
                    'نعم',
                    style: h3LiteTextStyle.copyWith(
                      color: kTraderBlackColor,
                    ),
                  ),
                ),
              ),
              HSpace(),
              Expanded(
                child: ButtonWrapper(
                  onTap: () {
                    if (onCancel != null) {
                      onCancel!();
                    }
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(vertical: kVPad / 2),
                  backgroundColor: kTraderPrimaryColor,
                  child: Text(
                    'لا',
                    style: h3LiteTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
