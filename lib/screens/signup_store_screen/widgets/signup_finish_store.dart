// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/models/types.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:project/utils/general_utils.dart';

class SignUpFinishStore extends StatelessWidget {
  final VoidCallback decrementActiveIndex;

  const SignUpFinishStore({
    Key? key,
    required this.decrementActiveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddingWrapper(
      child: Column(
        children: [
          VSpace(factor: 3),
          FormHeaderWithLogo(
            iconName: 'done',
            title: 'تم إنشاء متجرك بنجاح',
          ),
          VSpace(factor: 2),
          PaddingWrapper(
            padding: EdgeInsets.symmetric(horizontal: kHPad),
            child: Text(
              'يمكنك التحكم في متجرك كما يمكنك التصفح كمستخدم عادي',
              textAlign: TextAlign.center,
              style: h4TextStyleInactive,
            ),
          ),
          VSpace(factor: 2),
          SubmitFormButton(
            onTap: () {
              Navigator.pushReplacementNamed(context, HolderScreen.routeName);
            },
            title: 'فتح المتجر',
          ),
        ],
      ),
    );
  }
}
