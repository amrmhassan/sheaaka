// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/home_screen/widgets/trader_photo.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        children: [
          TraderPhoto(),
          HSpace(
            factor: 0.5,
          ),
          Text(
            'نيو فاشون',
            style: h3TextStyle,
          ),
          Spacer(),
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
