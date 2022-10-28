// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/h_space.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/trader_app/constants/colors.dart';

class OperationModal extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback onRemove;
  final VoidCallback? onCancel;
  final String? removeTitle;
  final String? cancelTitle;

  const OperationModal({
    Key? key,
    required this.title,
    required this.onRemove,
    this.onCancel,
    this.subTitle,
    this.cancelTitle,
    this.removeTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalWrapper(
      onApply: () {},
      showApplyModalButton: false,
      applyButtonTitle: '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: double.infinity),
          Text(
            title,
            style: h3TextStyle.copyWith(
              color: kTraderBlackColor,
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle!,
              style: h4TextStyleInactive.copyWith(
                color: kTraderSecondaryColor.withOpacity(.9),
              ),
            ),
          VSpace(),
          Row(
            children: [
              Expanded(
                child: ButtonWrapper(
                  onTap: () {
                    onRemove();
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.symmetric(vertical: kVPad / 2),
                  backgroundColor: kTraderSecondaryColor.withOpacity(.2),
                  child: Text(
                    removeTitle ?? 'نعم',
                    style: h3LiteTextStyle.copyWith(
                      color: kTraderBlackColor,
                    ),
                  ),
                ),
              ),
              HSpace(),
              Expanded(
                child: ButtonWrapper(
                  onTap: () {
                    Navigator.pop(context);
                    if (onCancel != null) {
                      onCancel!();
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: kVPad / 2),
                  backgroundColor: kTraderPrimaryColor,
                  child: Text(
                    cancelTitle ?? 'لا',
                    style: h3LiteTextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
