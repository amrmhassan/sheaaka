// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/navbar_icons_constants.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/screens/holder_screen/widgets/nav_bar_item.dart';

class NavBar extends StatelessWidget {
  final int activeIndex;
  final bool loadingData;

  final Function(int index) setActiveIndex;

  const NavBar({
    Key? key,
    required this.activeIndex,
    required this.setActiveIndex,
    required this.loadingData,
  }) : super(key: key);

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navBarIconsList(loadingData)
            .asMap()
            .entries
            .map(
              (e) => NavBarItem(
                navBarIcon: e.value,
                index: e.key,
                setActiveIndex: setActiveIndex,
                active: activeIndex == e.key,
              ),
            )
            .toList(),
      ),
    );
  }
}
