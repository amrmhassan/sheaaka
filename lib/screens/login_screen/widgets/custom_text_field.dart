// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String? iconName;
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
  final String? errorText;
  final String? Function(String? v)? validator;
  final bool enabled;
  final TextStyle? textStyle;
  final bool? requiredField;
  final BorderRadius? borderRadius;
  final int? maxLines;
  final String? initialValue;

  const CustomTextField({
    Key? key,
    this.iconName,
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
    this.errorText,
    this.validator,
    this.enabled = true,
    this.textStyle,
    this.requiredField,
    this.borderRadius,
    this.maxLines,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: padding ?? EdgeInsets.symmetric(horizontal: kHPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (requiredField == true)
                Text(
                  '*',
                  style: TextStyle(
                    height: 1,
                    color: kDangerColor,
                    fontSize: h2TextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius ??
                        BorderRadius.circular(smallBorderRadius),
                    border: Border.all(
                      width: 1,
                      color: errorText == null
                          ? (borderColor ?? kBlackColor)
                          : kDangerColor,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: kHPad / 2,
                    // vertical: kVPad / 2,
                  ),
                  child: Row(
                    children: [
                      if (iconName != null)
                        Image.asset(
                          'assets/icons/$iconName.png',
                          width: mediumIconSize,
                          color: errorText == null
                              ? (color ?? kBlackColor)
                              : kDangerColor,
                        ),
                      HSpace(factor: .5),
                      Expanded(
                        child: TextFormField(
                          maxLines: maxLines,
                          enabled: enabled,
                          validator: validator,
                          textInputAction:
                              textInputAction ?? TextInputAction.next,
                          obscureText: password,
                          autocorrect: !password,
                          controller: controller,
                          onChanged: onChange,
                          autofocus: autoFocus,
                          keyboardType: textInputType,
                          style: textStyle ?? h3LiteTextStyle,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: title,
                            hintStyle: errorText == null
                                ? h3LiteTextStyle
                                : h3LiteTextStyle.copyWith(
                                    color: kDangerColor,
                                  ),
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
              ),
            ],
          ),
          if (errorText != null)
            Text(
              errorText.toString(),
              style: h4LiteTextStyle.copyWith(color: kDangerColor),
            ),
        ],
      ),
    );
  }
}
