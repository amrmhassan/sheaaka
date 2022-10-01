// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/global/widgets/modal_wrapper/modal_wrapper.dart';
import 'package:project/global/widgets/modals/store_info_modal.dart';

class StoreInfo extends StatelessWidget {
  const StoreInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWrapper(
      onTap: () {
        showBottomSheet(
          elevation: 30,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (ctx) => ModalWrapper(
            // color: kLightColor,
            onApply: () {},
            applyButtonTitle: 'applyButtonTitle',
            showApplyModalButton: false,
            child: StoreInfoModal(),
          ),
        );
      },
      backgroundColor: Colors.transparent,
      borderRadius: 500,
      padding: EdgeInsets.all(largePadding),
      child: Image.asset(
        'assets/icons/info.png',
        width: mediumIconSize,
        color: kBlackColor,
      ),
    );
  }
}
