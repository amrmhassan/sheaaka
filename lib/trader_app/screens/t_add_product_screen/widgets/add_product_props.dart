// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/trader_app/constants/colors.dart';
import 'package:project/trader_app/screens/t_add_product_screen/widgets/add_color_button.dart';

class AddProductProps extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const AddProductProps({
    Key? key,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: h4TextStyleInactive.copyWith(
                  color: kTraderSecondaryColor,
                ),
              ),
              VSpace(factor: .5),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HSpace(),
              AddColorButton(),
              ...children,
              HSpace(factor: .5),
            ],
          ),
        ),
      ],
    );
  }
}
