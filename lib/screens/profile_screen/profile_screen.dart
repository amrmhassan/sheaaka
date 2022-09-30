// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/global/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:project/global/widgets/custom_app_bar/widgets/app_bar_icon.dart';
import 'package:project/global/widgets/full_loading_screen.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/screens_wrapper.dart';
import 'package:project/global/widgets/v_p_space.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/profile_screen/widgets/copy_rights.dart';
import 'package:project/screens/profile_screen/widgets/open_store_dashboard_button.dart';
import 'package:project/screens/profile_screen/widgets/policy_part.dart';
import 'package:project/screens/profile_screen/widgets/profile_screen_options.dart';
import 'package:project/screens/profile_screen/widgets/profile_summary.dart';
import 'package:project/screens/profile_screen/widgets/user_name.dart';
import 'package:project/screens/profile_screen/widgets/user_suggestions.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile-screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _loadingData = false;
  late User currentUser;
  late UserModel userModel;

  Future<void> fetchData() async {
    setState(() {
      _loadingData = true;
    });
    currentUser = FirebaseAuth.instance.currentUser as User;
    userModel = await Provider.of<UserProvider>(context, listen: false)
        .getUserData(currentUser.uid);
    setState(() {
      _loadingData = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _loadingData
            ? FullLoadingScreen(title: 'جاري تحميل معلوماتك')
            : Column(
                children: [
                  CustomAppBar(
                    boundRightIconWidth: true,
                    title: 'حسابي',
                    rightIcon: AppBarIcon(
                      onTap: () async {
                        Navigator.pushNamed(context, HolderScreen.routeName);
                        await FirebaseAuth.instance.signOut();
                      },
                      iconName: 'logout',
                      backgroundColor: Colors.transparent,
                      color: Colors.red,
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
