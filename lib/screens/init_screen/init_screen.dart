// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/global.dart';
import 'package:project/global/widgets/open_logging_screen.dart';
import 'package:project/models/types.dart';
import 'package:project/providers/app_state_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/trader_app/screens/t_holder_screen/t_holder_screen.dart';
import 'package:project/utils/general_utils.dart';
import 'package:project/utils/holder_screen_utils.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatefulWidget {
  static const String routeName = '/init-screen';
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  bool loadingData = false;
  bool noInternetNoData = false;
  Future<void> reloadProductsHolderScreen() async {
    setState(() {
      loadingData = true;
    });
    try {
      await loadData(context);
      int products = Provider.of<ProductsProvider>(context, listen: false)
          .allProducts
          .length;

      bool online = await checkConnectivity();
      bool allowTheApp = online || products > 0;
      setState(() {
        noInternetNoData = !allowTheApp;
      });
    } catch (e, stack) {
      if (kDebugMode) {
        rethrow;
      }
      showSnackBar(
        context: context,
        message: stack.toString(),
        snackBarType: SnackBarType.error,
      );
    }
    setState(() {
      loadingData = false;
    });
  }

  @override
  void initState() {
    if (kDebugMode) {
      showSnackBar(
        context: context,
        message: 'Starting the app from the beggining',
        snackBarType: SnackBarType.error,
      );
    }
    Future.delayed(Duration.zero).then((value) async {
      //* updating the app mode
      await Provider.of<AppStateProvider>(context, listen: false)
          .initTraderModeBool();
      await reloadProductsHolderScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool traderMode = Provider.of<AppStateProvider>(context).traderMode;
    return Stack(
      children: [
        traderMode
            ? THolderScreen(
                loadingData: loadingData,
              )
            : HolderScreen(
                loadingData: loadingData,
              ),
        if (kDebugMode && allowCheatLogout)
          GestureDetector(
            onTap: () {
              Provider.of<UserProvider>(context, listen: false).logOutGoogle();
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
        if (showLoggingBanner)
          Positioned(
            left: 0,
            top: 0,
            child: OpenLoggingScreen(),
          ),
      ],
    );
  }
}
