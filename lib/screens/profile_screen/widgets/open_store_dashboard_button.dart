// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/utils/general_utils.dart';
import 'package:provider/provider.dart';

class OpenStoreDashboardButton extends StatelessWidget {
  const OpenStoreDashboardButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return ButtonWrapper(
      onTap: userProvider.showOpenStoreButton
          ? () {
              //? open store
              showSnackBar(
                  context: context,
                  message: 'لم يتم برمجة هذا الجزء بعد',
                  snackBarType: SnackBarType.info);
            }
          : () {
              //? create new store
              showSnackBar(
                  context: context,
                  message: 'سوف يتم برمجتها لاحقا',
                  snackBarType: SnackBarType.info);
            },
      padding: EdgeInsets.symmetric(
        vertical: kVPad / 2,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //* this container is just to fix the stack and make it full width of the button
          Container(width: double.infinity),
          Text(
            userProvider.showOpenStoreButton ? 'فتح المتجر' : 'إنشاء متجر',
            style: h3TextStyle.copyWith(color: Colors.white),
          ),
          // Positioned(
          //   left: kHPad,
          //   child: NotifyingBox(
          //     title: '16',
          //   ),
          // )
        ],
      ),
    );
  }
}
