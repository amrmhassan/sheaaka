// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/login_screen/widgets/custom_text_field.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/products_control_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_tabs_screen/widgets/tab_card.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TTabsScreen extends StatefulWidget {
  static const String routeName = '/t-tabs-screen';

  const TTabsScreen({super.key});

  @override
  State<TTabsScreen> createState() => _TTabsScreenState();
}

class _TTabsScreenState extends State<TTabsScreen> {
  TextEditingController tabTitleController = TextEditingController();

  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  //? adding a new tab
  Future<void> handleAddNewTab(StoreModel myStore) async {
    if (tabTitleController.text.isEmpty) {
      return showSnackBar(
        context: context,
        message: 'لا يمكن أن يكون فارغا',
        snackBarType: SnackBarType.error,
      );
    }
    for (var tab in myStore.storeTabs) {
      if (tabTitleController.text == tab.title) {
        return showSnackBar(
          context: context,
          message: 'القسم موجود حاول تغيير الاسم',
          snackBarType: SnackBarType.error,
        );
      }
    }
    toggleLoading();
    try {
      var traderProviderFalse =
          Provider.of<TraderProvider>(context, listen: false);
      await traderProviderFalse.addNewTab(tabTitleController.text);
      showSnackBar(
          context: context,
          message: 'تمت إضافة قسم جديد',
          snackBarType: SnackBarType.success);
    } catch (e) {
      showSnackBar(
        context: context,
        message: e.toString(),
        snackBarType: SnackBarType.error,
      );
    }

    toggleLoading();
  }

  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    StoreModel myStore = traderProvider.myStore!;

    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (ctx) {
                return ModalWrapper(
                  applyButtonColor: kTraderPrimaryColor,
                  onApply: () => handleAddNewTab(myStore),
                  applyButtonTitle: 'إضافة ',
                  child: CustomTextField(
                    title: 'اسم القسم',
                    controller: tabTitleController,
                  ),
                );
              });
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
          CustomAppBar(
            traderStyle: true,
            rightTitle: true,
            title: 'أقسام المحل',
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(
            number: myStore.storeTabs.length,
            trailingTitle: 'قسم',
          ),
          VSpace(factor: .5),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: myStore.storeTabs.length,
              itemBuilder: (context, index) {
                StoreTabModel storeTabModel = myStore.storeTabs[index];
                return TabCard(storeTabModel: storeTabModel);
              },
            ),
          ),
        ],
      ),
    );
  }
}
