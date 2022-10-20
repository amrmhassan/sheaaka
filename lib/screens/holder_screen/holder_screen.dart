// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/share_wishlist_icon.dart';
import 'package:project/global/widgets/no_internet_full_screen.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/holder_screen/widgets/nav_bar.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/utils/holder_screen_utils.dart';
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
  Future<void> reloadProductsHolderScreen() async {
    setState(() {
      loading = true;
    });
    try {
      await loadData(context);
      int products = Provider.of<ProductsProvider>(context, listen: false)
          .allProducts
          .length;

      bool online = await checkConnectivity();
      bool allowTheApp = online || products > 0;
      setState(() {
        noInternetNoData = !allowTheApp;
      });
    } catch (e, stack) {
      if (kDebugMode) {
        rethrow;
      }
      showSnackBar(
        context: context,
        message: stack.toString(),
        snackBarType: SnackBarType.error,
      );
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      reloadProductsHolderScreen();
    });

    super.initState();
  }

//# holder screen stuff
  int activeIndex = 0;

  void setActiveIndex(int index) {
    if (loading) return;
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
        leftContent: [ShareWishlistIcon()],
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
      child: noInternetNoData
          ? NoInternetFullScreen()
          : Stack(
              children: [
                Column(
                  children: [
                    appBarGenerator(),
                    Expanded(
                      child: navBarIconsList(loading)[activeIndex].widget,
                    ),
                    NavBar(
                      activeIndex: activeIndex,
                      setActiveIndex: setActiveIndex,
                      loadingData: loading,
                    ),
                  ],
                ),
                // if (allowRandomCreatorCheats && kDebugMode)
                //   GestureDetector(
                //     onDoubleTap: () {
                //       Navigator.pushNamed(context, UploadDataScreen.routeName);
                //     },
                //     child: Container(
                //       width: 60,
                //       height: 60,
                //       color: Colors.transparent,
                //     ),
                //   ),
              ],
            ),
    );
  }
}
