// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/home_app_bar_left_content.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/share_wishlist_icon.dart';
import 'package:project/global/widgets/loading.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/screens/holder_screen/widgets/nav_bar.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class HolderScreen extends StatefulWidget {
  const HolderScreen({Key? key}) : super(key: key);
  static const String routeName = '/holder-screen';

  @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {
  bool noInternetNoData = false;
  bool loading = false;

  //# home Screen stuff
  Future<void> reloadProducts() async {
    setState(() {
      loading = true;
    });
    //? the loading in this screen only for the network checking
    await Provider.of<StoreProvider>(context, listen: false).fetchStores(true);
    await Provider.of<ProductsProvider>(context, listen: false)
        .reloadHomeProducts(true);
    int products = Provider.of<ProductsProvider>(context, listen: false)
        .homeProducts
        .length;

    bool online = await checkConnectivity();
    bool allowTheApp = online || products > 0;

    setState(() {
      noInternetNoData = !allowTheApp;
      loading = false;
    });
  }

  @override
  void initState() {
    reloadProducts();
    super.initState();
  }

//# holder screen stuff
  int activeIndex = 0;

  void setActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

//? this will change the appbar of the holder screen according to the current active nav bar index
  Widget appBarGenerator() {
    if (activeIndex == 0) {
      return CustomAppBar(
        title: 'شياكة',
        home: true,
      );
    } else if (activeIndex == 1) {
      return CustomAppBar(
        home: true,
        title: 'التصنيفات',
      );
    } else if (activeIndex == 2) {
      return CustomAppBar(
        home: true,
        title: 'المحلات',
      );
    } else if (activeIndex == 3) {
      return CustomAppBar(
        title: 'قوائم التمني',
        home: true,
        leftContent: Row(
          children: [
            ShareWishlistIcon(),
            HomeAppBarLeftContent(),
          ],
        ),
      );
    } else if (activeIndex == 4) {
      return CustomAppBar(
        home: true,
        title: 'محلات قريبة',
      );
    } else {
      return CustomAppBar(
        title: 'شياكة',
        home: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: loading
          ? Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Loading(
                title: 'جاري تحميل أحدث المنتجات',
              ),
            )
          : noInternetNoData
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity),
                    Image.asset(
                      'assets/icons/no-signal.png',
                      width: largeIconSize * 2,
                      color: kSecondaryColor,
                    ),
                    VSpace(factor: .5),
                    Text(
                      'لابد من وجود اتصال بالانترنت في أول مرة',
                      style: h3InactiveTextStyle,
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Column(
                      children: [
                        appBarGenerator(),
                        Expanded(
                          child: navBarIconsList[activeIndex].widget,
                        ),
                        NavBar(
                          activeIndex: activeIndex,
                          setActiveIndex: setActiveIndex,
                        ),
                      ],
                    ),
                    // if (allowRandomCreatorCheats) RandomCreatorCheatOpen(),
                  ],
                ),
    );
  }
}
