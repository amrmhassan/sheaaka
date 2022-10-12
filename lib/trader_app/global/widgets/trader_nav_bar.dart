// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/holder_screen/widgets/nav_bar_item.dart';

class TNavBar extends StatelessWidget {
  final int activeIndex;
  final Function(int i) setActiveIndex;
  const TNavBar(
      {super.key, required this.activeIndex, required this.setActiveIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: kHPad),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [defaultBoxShadow],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: kHPad * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: traderNavBarIconsList
              .map(
                (e) => NavBarItem(
                  navBarIcon: e,
                  index: traderNavBarIconsList.indexOf(e),
                  setActiveIndex: setActiveIndex,
                  active: activeIndex == traderNavBarIconsList.indexOf(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
