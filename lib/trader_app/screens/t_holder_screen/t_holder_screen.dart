// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/loading.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/screens/upload_data_screen/upload_data_screen.dart';
import 'package:project/trader_app/global/widgets/trader_nav_bar.dart';
import 'package:project/trader_app/providers/trader_provider.dart';
import 'package:project/trader_app/screens/t_holder_screen/widgets/show_my_store_button.dart';
import 'package:provider/provider.dart';

class THolderScreen extends StatefulWidget {
  final bool loadingData;
  const THolderScreen({Key? key, required this.loadingData}) : super(key: key);

  @override
  State<THolderScreen> createState() => _THolderScreenState();
}

class _THolderScreenState extends State<THolderScreen> {
  //# loading
  bool loading = false;
  void toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  //# fetching data
  Future<void> fetchStoreData() async {
    toggleLoading();
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      await Provider.of<AppStateProvider>(context, listen: false)
          .setTraderMode(false);
      return;
    }
    await Provider.of<TraderProvider>(context, listen: false)
        .fetchMyStoreData(false);
    toggleLoading();
  }

//# holder screen stuff
  int activeIndex = 1;
  void setActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

//? this will change the appbar of the holder screen according to the current active nav bar index
  Widget appBarGenerator(String storeName) {
    if (activeIndex == 1) {
      return CustomAppBar(
        userRole: UserRole.trader,
        title: storeName,
        home: true,
        leftContent: [
          ShowMyStoreButton(context: context),
          HSpace(),
        ],
      );
    } else if (activeIndex == 0) {
      return CustomAppBar(
        userRole: UserRole.trader,
        home: true,
        title: 'إحصائيات',
        leftContent: [],
      );
    } else if (activeIndex == 2) {
      return CustomAppBar(
        userRole: UserRole.trader,
        home: true,
        title: 'الطلبيات',
        leftContent: [],
      );
    } else {
      return CustomAppBar(
        userRole: UserRole.trader,
        title: storeName,
        home: true,
      );
    }
  }

  @override
  void initState() {
    fetchStoreData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var traderProvider = Provider.of<TraderProvider>(context);
    return ScreensWrapper(
      child: loading
          ? Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Loading(
                title: 'جاري تحميل متجرك',
              ),
            )
          : Stack(
              children: [
                Column(
                  children: [
                    appBarGenerator(traderProvider.myStore!.name),
                    Expanded(
                      child: traderNavBarIconsList[activeIndex].widget,
                    ),
                    TNavBar(
                      activeIndex: activeIndex,
                      setActiveIndex: setActiveIndex,
                    ),
                  ],
                ),
                if (allowRandomCreatorCheats && kDebugMode)
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, UploadDataScreen.routeName);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.transparent,
                    ),
                  ),
              ],
            ),
    );
  }
}
