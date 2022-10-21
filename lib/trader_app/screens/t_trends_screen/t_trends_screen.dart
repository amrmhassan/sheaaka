// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/trader_app/constants/colors.dart';

class TTrendsScreen extends StatelessWidget {
  static const String routeName = '/t-trends-screen';
  const TTrendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              traderStyle: true,
              rightTitle: true,
              title: 'عرض جديد',
            ),
            VSpace(factor: .5),
            HLine(
              color: kTraderLightColor.withOpacity(.2),
              thickness: 2,
            ),
            VSpace(factor: .5),
          ],
        ),
      ),
    );
  }
}
