// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/store_model.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/providers/ads_provider.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_add_product_screen/t_add_product_screen.dart';
import 'package:project/trader_app/screens/t_ads_screen/t_ads_screen.dart';
import 'package:project/trader_app/screens/t_home_screen/widgets/trader_home_element.dart';
import 'package:project/trader_app/screens/t_offers_screen/t_offers_screen.dart';
import 'package:project/trader_app/screens/t_pictures_library_screen/t_pictures_library_screen.dart';
import 'package:project/trader_app/screens/t_products_screen/t_products_screen.dart';
import 'package:project/trader_app/screens/t_tabs_screen/t_tabs_screen.dart';
import 'package:project/trader_app/screens/t_trends_screen/t_trends_screen.dart';
import 'package:provider/provider.dart';

class THomeScreen extends StatelessWidget {
  const THomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    var productsProvider = Provider.of<ProductsProvider>(context);
    StoreModel myStore = traderProvider.myStore!;
    var storeProducts = productsProvider.getStoreProducts(myStore.id);
    var storeProvider = Provider.of<StoreProvider>(context);
    List<OfferModel> myStoreOffers = storeProvider.offers
        .where(
          (element) => element.storeId == myStore.id,
        )
        .toList();
    var adsProvider = Provider.of<AdsProvider>(context);
    var ads = adsProvider.ads
        .where(
          (element) => element.storeId == myStore.id,
        )
        .toList();

    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 2),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                TraderHomeElement(
                  iconName: 'wardrobe',
                  onTap: () {
                    if (storeProducts.isNotEmpty) {
                      Navigator.pushNamed(context, TProductsScreen.routeName);
                    } else {
                      Navigator.pushNamed(
                        context,
                        TAddProductScreen.routeName,
                      );
                    }
                  },
                  title: '????????????????',
                  value: storeProducts.length.toString(),
                ),
                TraderHomeElement(
                  iconName: 'megaphone',
                  onTap: () {
                    Navigator.pushNamed(context, TAdsScreen.routeName,
                        arguments: ads);
                  },
                  title: '?????????????? ??????????',
                  value: ads.length.toString(),
                ),
                TraderHomeElement(
                  iconName: 'offer',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TOffersScreen.routeName,
                      arguments: myStoreOffers,
                    );
                  },
                  title: '????????????',
                  value: myStoreOffers
                      .where((element) => element.active)
                      .length
                      .toString(),
                ),
                TraderHomeElement(
                  iconName: 'sections',
                  onTap: () {
                    Navigator.pushNamed(context, TTabsScreen.routeName,
                        arguments: storeProducts);
                  },
                  title: '?????????? ??????????',
                  value: (myStore.storeTabs.length - 1).toString(),
                ),
                TraderHomeElement(
                  iconName: 'fire1',
                  onTap: () {
                    Navigator.pushNamed(context, TTrendsScreen.routeName);
                  },
                  title: '????????????',
                  value: '9',
                ),
                CertifiedHeader(title: '?????? ??????????'),
                VSpace(factor: .5),
                TraderHomeElement(
                  iconName: 'gallery',
                  onTap: () {
                    Navigator.pushNamed(
                        context, TPicturesLibraryScreen.routeName);
                  },
                  title: '?????????? ??????????',
                  value: ' ',
                ),
                Row(
                  children: [
                    Expanded(
                      child: TraderHomeElement(
                        title: '???????? ??????????????',
                        onTap: () {},
                      ),
                    ),
                    HSpace(),
                    Expanded(
                      child: TraderHomeElement(
                        title: '???????????? ????????????????',
                        onTap: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CertifiedHeader extends StatelessWidget {
  final String title;
  const CertifiedHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: h4TextStyleInactive.copyWith(color: kTraderSecondaryColor),
        ),
        HSpace(factor: .5),
        Expanded(
          child: HLine(
            thickness: 2,
            color: kTraderSecondaryColor.withOpacity(.2),
          ),
        ),
      ],
    );
  }
}
