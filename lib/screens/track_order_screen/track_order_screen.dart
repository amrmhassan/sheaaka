// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/track_order_screen/widgets/p_d_button.dart';
import 'package:project/screens/track_order_screen/widgets/tracker_steps.dart';

class TrackOrderScreen extends StatelessWidget {
  static const String routeName = '/track-order-screen';
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: Column(
        children: [
          CustomAppBar(
            title: 'تتبع المنتج',
          ),
          VSpace(),
          TrackerSteps(),
          OpenProductDescriptionFromTrackerButton(),
        ],
      ),
    );
  }
}
