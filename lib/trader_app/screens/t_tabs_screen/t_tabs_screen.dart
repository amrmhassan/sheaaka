// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/firebase_constants.dart';
import 'package:project/constants/models_constants.dart';
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
import 'package:project/trader_app/providers/add_product_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_tabs_screen/widgets/tab_card.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class TTabsScreen extends StatelessWidget {
  static const String routeName = '/t-tabs-screen';

  const TTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    StoreModel myStore = traderProvider.myStore!;

    TextEditingController tabTitleController = TextEditingController();
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
                  onApply: () async {
                    if (tabTitleController.text.isEmpty) {
                      return showSnackBar(
                        context: context,
                        message: 'لا يمكن أن يكون فارغا',
                        snackBarType: SnackBarType.error,
                      );
                    }
                    //? adding a new tab
                    await FirebaseFirestore.instance
                        .collection(storesCollectionName)
                        .doc(myStore.id)
                        .update({
                      storeTabsString: [
                        StoreTabModel(
                            productsIds: [], title: tabTitleController.text),
                        ...myStore.storeTabs.map((e) => e.toJSON())
                      ]
                    });
                  },
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
            Provider.of<AddProductProvider>(context).loading
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
