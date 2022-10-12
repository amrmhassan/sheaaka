// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/models/types.dart';

const double width = 200;
const double borderWidth = 1;
const double height = 50;

class EmailTypeSwitch extends StatelessWidget {
  final UserRole userRole;

  final Function(UserRole userRole) setUserRole;
  const EmailTypeSwitch({
    Key? key,
    required this.userRole,
    required this.setUserRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool on = userRole == UserRole.normal;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => setUserRole(on ? UserRole.trader : UserRole.normal),
          child: Stack(
            children: [
              Positioned(
                right: on ? 0 : width / 2 + borderWidth,
                child: Container(
                  width: width / 2,
                  height: height,
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(mediumBorderRadius),
                  ),
                ),
              ),
              Container(
                width: width + 2 * borderWidth,
                height: height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    mediumBorderRadius,
                  ),
                  border: Border.all(
                    width: borderWidth,
                    color: kBlackColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: width / 2,
                      child: Text(
                        'عادي',
                        style: h3TextStyle.copyWith(
                          color: on
                              ? Colors.white
                              : kInActiveTextColor.withOpacity(.5),
                        ),
                      ),
                    ),
                    Container(
                      width: width / 2,
                      alignment: Alignment.center,
                      child: Text(
                        'تاجر',
                        style: h3TextStyle.copyWith(
                          color: on
                              ? kInActiveTextColor.withOpacity(.5)
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
