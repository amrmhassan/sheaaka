// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/home_app_bar_left_content.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/share_wishlist_icon.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/screens/holder_screen/widgets/nav_bar.dart';

class HolderScreen extends StatefulWidget {
  const HolderScreen({Key? key}) : super(key: key);
  static const String routeName = '/holder-screen';

  @override
  State<HolderScreen> createState() => _HolderScreenState();
}

class _HolderScreenState extends State<HolderScreen> {
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
      child: Column(
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
    );
  }
}
