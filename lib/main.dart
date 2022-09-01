// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/screens/cart_screen/cart_screen.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/screens/store_screen/store_screen.dart';

bool testing = false;
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      locale: Locale("ar", "AE"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Cairo',
            color: kActiveTextColor,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Cairo',
            color: kActiveTextColor,
          ),
        ),
      ),
      initialRoute: HolderScreen.routeName,
      routes: {
        HolderScreen.routeName: (context) => HolderScreen(),
        ProductScreen.routeName: (context) => ProductScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        StoreScreen.routeName: (context) => StoreScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
    );
  }
}
