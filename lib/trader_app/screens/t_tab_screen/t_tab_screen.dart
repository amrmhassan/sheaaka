// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/product_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/store_screen/widgets/store_all_products_grid.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_tab_screen/widgets/add_tab_product.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TTabScreen extends StatefulWidget {
  static const String routeName = '/t-tab-screen';

  const TTabScreen({super.key});

  @override
  State<TTabScreen> createState() => _TTabsScreenState();
}

class _TTabsScreenState extends State<TTabScreen> {
  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  //? for adding new products to the tab
  Future handleAddProductsToTab(
    List<ProductModel> products,
    StoreTabModel activeStoreTab,
  ) async {
    try {
      toggleLoading();
      await Provider.of<TraderProvider>(context, listen: false)
          .addProductsToTab(products, activeStoreTab);
      showSnackBar(
          context: context,
          message: 'تمت الإضافة بنجاح',
          snackBarType: SnackBarType.success);
    } catch (e) {
      showSnackBar(
          context: context,
          message: e.toString(),
          snackBarType: SnackBarType.error);
    }
    toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    int tabIndex = ModalRoute.of(context)!.settings.arguments as int;
    var productsProvider = Provider.of<ProductsProvider>(context);

    var traderProvider = Provider.of<TraderProvider>(context);
    StoreModel myStore = traderProvider.myStore!;
    StoreTabModel stateStoreTab = myStore.storeTabs[tabIndex];
    List<String> modifedListIds = ['add', ...stateStoreTab.productsIds];

    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            traderStyle: true,
            rightTitle: true,
            title: stateStoreTab.title,
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(
            number: stateStoreTab.productsIds.length,
            trailingTitle: 'منتج في هذا القسم',
            leadingTitle: 'يوجد',
          ),
          VSpace(factor: .5),
          Expanded(
            child: GridView.count(
              // padding: EdgeInsets.symmetric(vertical: kVPad),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1,
              children: List.generate(
                modifedListIds.length,
                (index) {
                  if (modifedListIds[index] == 'add') {
                    return AddTabProduct(
                      currentActiveStoreTab: stateStoreTab,
                      handleAddProductsToTab: (List<ProductModel> products) =>
                          handleAddProductsToTab(products, stateStoreTab),
                    );
                  } else {
                    ProductModel productModel =
                        productsProvider.findProductById(modifedListIds[index]);
                    return StoreProductCardSquare(
                      imagePath: productModel.imagesPath[0],
                      productId: productModel.id,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
