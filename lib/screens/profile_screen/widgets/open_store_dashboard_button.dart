// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/button_wrapper.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';
import 'package:project/trader_app/screens/t_holder_screen/t_holder_screen.dart';
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
          ? () async {
              await Navigator.pushReplacementNamed(
                  context, THolderScreen.routeName);
            }
          : () {
              //? create new store
              UserModel? user =
                  Provider.of<UserProvider>(context, listen: false).userModel;
              Navigator.pushReplacementNamed(
                  context, SignUpStoreScreen.routeName,
                  arguments: user?.userProfilePhoto);
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
