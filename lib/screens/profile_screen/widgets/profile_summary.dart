// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/profile_image.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/profile_screen/widgets/profile_summary_element.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(
          radius: 80,
          border: Border.all(
            width: 1,
            color: kSecondaryColor,
          ),
          padding: EdgeInsets.all(smallPadding / 3),
        ),
        HSpace(),
        ProfileSummaryElement(
          amount: '5',
          title: 'عربة التسوق',
        ),
        ProfileSummaryElement(
          amount: '4',
          title: "طلبيات",
        ),
        ProfileSummaryElement(
          amount: '20',
          title: "قائمة التمني",
        ),
      ],
    );
  }
}
