// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/store_model.dart';
import 'package:project/models/store_tab_model.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/add_product_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_add_product_screen/t_add_product_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/widgets/section_element_number.dart';
import 'package:project/trader_app/screens/t_tabs_screen/widgets/tab_card.dart';
import 'package:provider/provider.dart';

class TTabsScreen extends StatelessWidget {
  static const String routeName = '/t-tabs-screen';

  const TTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    StoreModel myStore = traderProvider.myStore!;
    return ScreensWrapper(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTraderPrimaryColor,
        onPressed: () {},
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
