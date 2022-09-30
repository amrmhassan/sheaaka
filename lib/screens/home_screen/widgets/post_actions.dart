// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/custom_icon_button.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/utils/screens_utils/post_actions_utils.dart';

class PostActions extends StatelessWidget {
  final bool? bookMarked;
  final int lovesNumber;
  final String productId;
  final String? wishlistItemId;

  const PostActions({
    Key? key,
    this.bookMarked,
    required this.lovesNumber,
    required this.productId,
    required this.wishlistItemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return PaddingWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          handleShowBookMarkButton(
            context,
            productId,
            wishlistItemId,
          ),
          Spacer(),
          CustomIconButton(iconName: 'share', onTap: () {}),
          if (user != null)
            Row(
              children: [
                HSpace(),
                Column(
                  children: [
                    handleShowLoveButton(context, productId),
                    Text(
                      lovesToString(lovesNumber),
                      textAlign: TextAlign.justify,
                      style: h4TextStyleInactive.copyWith(height: 1),
                    )
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
