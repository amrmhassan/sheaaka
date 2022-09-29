// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class CustomFormInput extends StatelessWidget {
  final String title;
  final String iconName;
  final Function(String v)? onChange;
  final String? trailingIconName;
  final Widget? trailingIconWidget;
  final Color? color;
  final Color? borderColor;
  final EdgeInsets? padding;
  final Color? trailingIconColor;
  final bool autoFocus;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool password;
  final VoidCallback? handleShowPassword;
  final TextInputAction? textInputAction;

  const CustomFormInput({
    Key? key,
    required this.iconName,
    required this.title,
    this.onChange,
    this.trailingIconName,
    this.color,
    this.borderColor,
    this.padding,
    this.trailingIconWidget,
    this.trailingIconColor,
    this.autoFocus = false,
    this.controller,
    this.textInputType,
    this.password = false,
    this.handleShowPassword,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: padding ?? EdgeInsets.symmetric(horizontal: kHPad),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kHPad / 2,
          // vertical: kVPad / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(smallBorderRadius),
          border: Border.all(width: 1, color: borderColor ?? kBlackColor),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/$iconName.png',
              width: mediumIconSize,
              color: color ?? kBlackColor,
            ),
            HSpace(factor: .5),
            Expanded(
              child: TextField(
                textInputAction: textInputAction ?? TextInputAction.next,
                obscureText: password,
                autocorrect: !password,
                controller: controller,
                onChanged: onChange,
                autofocus: autoFocus,
                keyboardType: textInputType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title,
                  hintStyle: h3LiteTextStyle,
                ),
              ),
            ),
            if (trailingIconName != null)
              GestureDetector(
                onTap: handleShowPassword,
                child: Image.asset(
                  'assets/icons/$trailingIconName.png',
                  width: mediumIconSize,
                  color: trailingIconColor ?? kSecondaryColor,
                ),
              ),
            if (trailingIconWidget != null) trailingIconWidget!
          ],
        ),
      ),
    );
  }
}
