// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:flutter/material.dart';

class DoubleButtonsModal extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback onOk;
  final VoidCallback? onCancel;
  final String? okText;
  final String? cancelText;
  final Color? okColor;
  final Color? cancelColor;
  final bool autoPop;
  final TextDirection? textDirection;

  const DoubleButtonsModal({
    Key? key,
    required this.onOk,
    required this.title,
    this.onCancel,
    this.subTitle,
    this.okText,
    this.cancelText,
    this.okColor,
    this.cancelColor,
    this.autoPop = true,
    this.textDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      showTopLine: false,
      child: Column(
        children: [
          Row(
            textDirection: textDirection,
            children: [
              Text(
                title,
                style: h3TextStyle,
                textDirection: textDirection,
              ),
            ],
          ),
          if (subTitle != null)
            Row(
              textDirection: textDirection,
              children: [
                Expanded(
                  child: Text(
                    subTitle.toString(),
                    style: h4TextStyleInactive,
                    textDirection: textDirection,
                    softWrap: true,
                  ),
                ),
              ],
            ),
          VSpace(),
          Row(
            textDirection: textDirection,
            children: [
              Expanded(
                child: ButtonWrapper(
                  backgroundColor: cancelColor ?? kDangerColor,
                  onTap: () {
                    if (onCancel != null) onCancel!();
                    if (autoPop) {
                      Navigator.pop(context);
                    }
                  },
                  padding: EdgeInsets.symmetric(
                      horizontal: kHPad / 2, vertical: kVPad / 2),
                  child: Text(
                    cancelText ?? 'Cancel',
                    style: h4TextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
              HSpace(),
              Expanded(
                child: ButtonWrapper(
                  backgroundColor: okColor ?? kDangerColor,
                  onTap: () async {
                    onOk();
                    if (autoPop) {
                      Navigator.pop(context);
                    }
                  },
                  padding: EdgeInsets.symmetric(
                      horizontal: kHPad / 2, vertical: kVPad / 2),
                  child: Text(
                    okText ?? 'Delete',
                    style: h4TextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
