// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/global/widgets/no_internet_full_screen.dart';
import 'package:project/global/widgets/screens_wrapper.dart';

class NoInternetScreen extends StatelessWidget {
  static const String routeName = '/no-internet-screen';

  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreensWrapper(
      child: NoInternetFullScreen(),
    );
  }
}
