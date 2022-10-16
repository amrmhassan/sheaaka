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

class TTabScreen extends StatefulWidget {
  static const String routeName = '/t-tab-screen';

  const TTabScreen({super.key});

  @override
  State<TTabScreen> createState() => _TTabsScreenState();
}

class _TTabsScreenState extends State<TTabScreen> {
  @override
  Widget build(BuildContext context) {
    StoreTabModel storeTabModel =
        ModalRoute.of(context)!.settings.arguments as StoreTabModel;

    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            traderStyle: true,
            rightTitle: true,
            title: storeTabModel.title,
          ),
          VSpace(factor: .5),
          HLine(
            color: kTraderLightColor.withOpacity(.2),
            thickness: 2,
          ),
          VSpace(factor: .5),
          SectionElementsNumber(
            number: storeTabModel.productsIds.length,
            trailingTitle: 'منتج في هذا القسم',
            leadingTitle: 'يوجد',
          ),
          VSpace(factor: .5),
        ],
      ),
    );
  }
}
