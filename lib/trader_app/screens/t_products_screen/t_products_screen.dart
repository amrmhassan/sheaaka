// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/empty_widget.dart';
import 'package:project/global/widgets/h_line.dart';
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
import 'package:project/trader_app/screens/t_products_screen/widgets/operation_modal.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/t_product_screen_app_bar.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/trader_product_card.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/uploading_product.dart';
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
          return OperationModal(
            title: 'هل تريد تعديل أو حذف المنتج ؟',
            onRemove: () {
              handleRemoveProduct(productModel);
            },
            onCancel: () {
              Navigator.pushNamed(
                context,
                TAddProductScreen.routeName,
                arguments: productModel,
              );
            },
            subTitle: 'سيتم حذف كل ما يتعلق بالمنتج',
            removeTitle: 'حذف',
            cancelTitle: 'تعديل',
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
          if (storeProducts.isNotEmpty)
            SectionElementsNumber(number: storeProducts.length),
          VSpace(factor: .5),
          if (pcp.loading) UploadingProduct(),
          Expanded(
            child: storeProducts.isNotEmpty
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: storeProducts.length,
                    itemBuilder: (context, index) {
                      ProductModel productModel = storeProducts[index];
                      return TraderProductCard(
                        productModel: productModel,
                        removeProduct: showRemoveProductModal,
                      );
                    },
                  )
                : EmptyWidget(title: 'لا توجد منتجات'),
          ),
        ],
      ),
    );
  }
}
