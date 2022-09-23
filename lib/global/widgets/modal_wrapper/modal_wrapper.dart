// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/h_line.dart';
import 'package:project/global/widgets/modal_wrapper/widgets/apply_modal_button.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';

class ModalWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback onApply;
  final String applyButtonTitle;
  final bool showApplyModalButton;
  final Color? color;

  const ModalWrapper({
    Key? key,
    required this.child,
    required this.onApply,
    required this.applyButtonTitle,
    this.showApplyModalButton = true,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: kHPad,
        left: kHPad,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(largeBorderRadius),
          topRight: Radius.circular(largeBorderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VSpace(),
          HLine(
            width: 4,
            color: kSecondaryColor.withOpacity(.4),
            borderRadius: 50,
            widthFactor: .3,
          ),
          VSpace(factor: 2),
          child,
          VSpace(factor: 2),
          if (showApplyModalButton)
            ApplyModalButton(
                onTap: () {
                  onApply();
                  Navigator.pop(context);
                },
                title: applyButtonTitle),
          if (showApplyModalButton) VSpace(factor: 2),
        ],
      ),
    );
  }
}
