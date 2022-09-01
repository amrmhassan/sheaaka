// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_p_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/profile_screen/widgets/copy_rights.dart';
import 'package:project/screens/profile_screen/widgets/open_store_dashboard_button.dart';
import 'package:project/screens/profile_screen/widgets/policy_part.dart';
import 'package:project/screens/profile_screen/widgets/profile_screen_options.dart';
import 'package:project/screens/profile_screen/widgets/profile_summary.dart';
import 'package:project/screens/profile_screen/widgets/user_name.dart';
import 'package:project/screens/profile_screen/widgets/user_suggestions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile-screen';

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              boundRightIconWidth: true,
              title: 'حسابي',
              rightIcon: Image.asset(
                'assets/icons/logout.png',
                color: kDangerColor,
              ),
            ),
            VSpace(),
            PaddingWrapper(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSummary(),
                  UserName(),
                  VSpace(),
                  HLine(width: 1, color: kSecondaryColor.withOpacity(.2)),
                  VSpace(),
                  ProfileScreenOptions(),
                  VSpace(),
                  OpenStoreDashboardButton(),
                ],
              ),
            ),
            //* at least push this 3 factor space+
            VPSpace(percentage: 10),
            // Spacer(),
            //* footer
            PaddingWrapper(
              child: Column(
                children: [
                  UserSuggestions(),
                  VSpace(factor: .5),
                  PolicyPart(),
                  VSpace(factor: .5),
                  CopyRights(),
                  VSpace(factor: 0),
                ],
              ),
            ),
            VSpace(),
          ],
        ),
      ),
    );
  }
}
