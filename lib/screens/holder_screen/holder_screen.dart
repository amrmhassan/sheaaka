// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'شياكة',
            home: true,
          ),
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
