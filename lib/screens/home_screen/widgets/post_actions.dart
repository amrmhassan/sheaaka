// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class PostActions extends StatelessWidget {
  const PostActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconButton(iconName: 'book-mark', onTap: () {}),
          Spacer(),
          CustomIconButton(iconName: 'share', onTap: () {}),
          HSpace(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomIconButton(iconName: 'heart', onTap: () {}),
              Text(
                '2k',
                textAlign: TextAlign.justify,
                style: h4TextStyleInactive.copyWith(height: 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}
