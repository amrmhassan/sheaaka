// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';

const double width = 200;
const double borderWidth = 1;
const double height = 50;

class EmailTypeSwitch extends StatefulWidget {
  const EmailTypeSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<EmailTypeSwitch> createState() => _EmailTypeSwitchState();
}

class _EmailTypeSwitchState extends State<EmailTypeSwitch> {
  bool on = true;
  void toggleButton() {
    setState(() {
      on = !on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: toggleButton,
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
                          color: on ? Colors.white : kBlackColor,
                        ),
                      ),
                    ),
                    Container(
                      width: width / 2,
                      alignment: Alignment.center,
                      child: Text(
                        'تاجر',
                        style: h3TextStyle.copyWith(
                          color: on ? kBlackColor : Colors.white,
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
