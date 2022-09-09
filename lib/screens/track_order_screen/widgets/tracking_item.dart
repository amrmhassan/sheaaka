// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';

class TrackingItem extends StatelessWidget {
  final bool active;
  final String title;
  final bool last;
  final String subTitle;

  const TrackingItem({
    Key? key,
    this.active = false,
    required this.title,
    this.last = false,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            !last
                ? Container(
                    height: 80,
                    width: 2,
                    color: kSecondaryColor,
                  )
                : SizedBox(),
            Container(
              padding: EdgeInsets.all(mediumPadding),
              width: mediumIconSize,
              height: mediumIconSize,
              decoration: BoxDecoration(
                color: active ? kPrimaryColor : Colors.white,
                borderRadius: BorderRadius.circular(500),
                border: active
                    ? null
                    : Border.all(
                        width: 2,
                        color: kSecondaryColor,
                      ),
              ),
              child: active
                  ? Image.asset(
                      'assets/icons/check-mark.png',
                      color: Colors.white,
                    )
                  : SizedBox(),
            ),
          ],
        ),
        HSpace(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: h2TextStyle.copyWith(
                color: active
                    ? kInActiveTextColor.withOpacity(.4)
                    : kInActiveTextColor,
              ),
            ),
            Text(
              subTitle,
              style: h4TextStyleInactive.copyWith(
                color: active
                    ? kInActiveTextColor.withOpacity(.4)
                    : kInActiveTextColor,
                height: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}
