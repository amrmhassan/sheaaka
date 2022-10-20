// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project/constants/shared_pref_constants.dart';
import 'package:project/helpers/shared_pref_helper.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/trader_app/screens/t_holder_screen/t_holder_screen.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  static const String routeName = '/init-screen';
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<AppStateProvider>(context).traderMode
        ? THolderScreen()
        : HolderScreen();
  }
}
