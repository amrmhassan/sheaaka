// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/comments_screen/comments_screen.dart';

class OpenProductCommentsButton extends StatelessWidget {
  const OpenProductCommentsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {
        Navigator.pushNamed(context, CommentsScreen.routeName);
      },
      width: 50,
      height: 50,
      padding: EdgeInsets.all(mediumPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(smallBorderRadius),
          border: Border.all(
            width: 1,
            color: kBlackColor,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
            ),
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/icons/ask.png'),
        ],
      ),
    );
  }
}
