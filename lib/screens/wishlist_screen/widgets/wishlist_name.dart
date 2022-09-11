// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:provider/provider.dart';

class WishListName extends StatelessWidget {
  final String title;
  final bool active;
  final String id;

  const WishListName({
    Key? key,
    required this.title,
    required this.id,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      backgroundColor: active ? kPrimaryColor : kSecondaryColor.withOpacity(.1),
      onTap: () {
        Provider.of<WishListsProvider>(context, listen: false)
            .setActiveWishList(id);
      },
      margin: EdgeInsets.only(left: kHPad / 2.5),
      padding: EdgeInsets.symmetric(
        horizontal: kHPad / 2,
        vertical: kHPad / 3,
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
