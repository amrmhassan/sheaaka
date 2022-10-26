// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/group_header.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/models/ads_model.dart';
import 'package:project/screens/trend_screen/widgets/user_ads_card.dart';

class FireSection extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final List<Widget> children;

  const FireSection({
    Key? key,
    required this.children,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GroupHeader(
          title: title,
          subTitle: 'الكل',
          onTap: onTap,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                HSpace(),
                ...children,
              ],
            ),
          ),
        )
      ],
    );
  }
}
