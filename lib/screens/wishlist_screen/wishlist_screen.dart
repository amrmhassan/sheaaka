// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace(),
          PaddingWrapper(
            child: Text(
              'قوائم التمني',
              style: h4LiteTextStyle,
            ),
          ),
          VSpace(factor: .5),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HSpace(),
                AddWishListButton(),
                HSpace(factor: .5),
                WishListName(
                  title: 'الكل',
                ),
                WishListName(
                  title: 'فرح أخويا',
                  active: true,
                ),
                WishListName(
                  title: 'شنط العيال',
                ),
                WishListName(
                  title: 'تحويش البدلة',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WishListName extends StatelessWidget {
  final String title;
  final bool active;

  const WishListName({
    Key? key,
    required this.title,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: active ? kPrimaryColor : kSecondaryColor.withOpacity(.1),
      onTap: () {},
      margin: EdgeInsets.only(left: kHPad / 2.5),
      padding: EdgeInsets.symmetric(
        horizontal: kHPad,
        vertical: kHPad / 2.5,
      ),
      child: Text(
        title,
        style: h3TextStyle.copyWith(
          color: active ? Colors.white : kInActiveTextColor,
        ),
      ),
    );
  }
}

class AddWishListButton extends StatelessWidget {
  const AddWishListButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(mediumPadding),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: kSecondaryColor,
        ),
        borderRadius: BorderRadius.circular(smallBorderRadius),
      ),
      child: Image.asset(
        'assets/icons/plus.png',
        color: kSecondaryColor,
        width: mediumIconSize,
      ),
    );
  }
}
