// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/home_screen/widgets/trader_photo.dart';

class PostHeader extends StatelessWidget {
  final String? logoImagePath;
  final String storeName;
  final int offersNumber;

  const PostHeader({
    Key? key,
    required this.logoImagePath,
    required this.storeName,
    required this.offersNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        children: [
          TraderPhoto(
            logoImagePath: logoImagePath,
            offersNumber: offersNumber,
          ),
          HSpace(
            factor: 0.5,
          ),
          Expanded(
            flex: 3,
            child: Text(
              storeName,
              style: h3TextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            children: [
              CustomIconButton(iconName: 'add-friend', onTap: () {}),
              HSpace(factor: 0.5),
              CustomIconButton(iconName: 'dots', onTap: () {})
            ],
          ),
        ],
      ),
    );
  }
}
