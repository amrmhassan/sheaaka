// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:project/constants/sizes.dart';
import 'package:project/constants/styles.dart';
import 'package:project/global/widgets/v_space.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/home_screen/widgets/padding_wrapper.dart';
import 'package:project/screens/init_screen/init_screen.dart';
import 'package:project/screens/login_screen/widgets/form_header_with_logo.dart';
import 'package:project/screens/login_screen/widgets/submit_form_button.dart';
import 'package:provider/provider.dart';

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
            onTap: () async {
              Navigator.popUntil(context, (route) => false);
              await Provider.of<AppStateProvider>(context, listen: false)
                  .setTraderMode(true);
              Navigator.pushNamed(context, InitScreen.routeName);
            },
            title: 'فتح المتجر',
          ),
        ],
      ),
    );
  }
}
