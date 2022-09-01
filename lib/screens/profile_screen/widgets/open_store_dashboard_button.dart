// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/screens/profile_screen/widgets/notifying_box.dart';

class OpenStoreDashboardButton extends StatelessWidget {
  const OpenStoreDashboardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {},
      padding: EdgeInsets.symmetric(
        vertical: kVPad / 2,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //* this container is just to fix the stack and make it full width of the button
          Container(width: double.infinity),
          Text(
            'فتح المتجر',
            style: h3TextStyle.copyWith(color: Colors.white),
          ),
          Positioned(
            left: kHPad,
            child: NotifyingBox(
              title: '16',
            ),
          )
        ],
      ),
    );
  }
}
