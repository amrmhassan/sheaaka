// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/screens/profile_screen/widgets/profile_page_element.dart';

class UserSuggestions extends StatelessWidget {
  const UserSuggestions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfilePageElement(
      padding:
          EdgeInsets.symmetric(vertical: kVPad / 1.5, horizontal: kHPad / 1.5),
      iconName: 'support',
      onTap: () {},
      title: 'كيف تريدنا أن نحسن خدماتنا',
      backgroundColor: kSecondaryColor.withOpacity(0.1),
    );
  }
}
