// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback startSearch;
  final Function(String value) updateSearchQuery;
  const SearchBox({
    Key? key,
    required this.startSearch,
    required this.updateSearchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      alignment: Alignment.centerRight,
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: kSecondaryColor.withOpacity(.3),
          ),
        ),
      ),
      child: Row(
        children: [
          ButtonWrapper(
            onTap: () {},
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/icons/search1.png',
              width: mediumIconSize,
              color: kSecondaryColor,
            ),
          ),
          HSpace(),
          Expanded(
            child: TextField(
              onChanged: (value) {
                updateSearchQuery(value);
              },
              keyboardType: TextInputType.url,
              autofocus: true,
              onSubmitted: (v) => startSearch(),
              decoration: InputDecoration(
                hintText: 'قم بالبحث هنا...',
                hintStyle: h3InactiveTextStyle,
                border: InputBorder.none,
              ),
              style: h3LiteTextStyle,
            ),
          ),
          AppBarIcon(
            onTap: () {
              Navigator.pop(context);
            },
            iconName: 'arrow',
            backgroundColor: Colors.transparent,
            color: kSecondaryColor,
          )
        ],
      ),
    );
  }
}
