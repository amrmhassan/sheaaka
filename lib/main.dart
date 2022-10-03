// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/constants/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project/providers/cart_provider.dart';
import 'package:project/providers/location_provider.dart';
import 'package:project/providers/orders_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/providers/search_provider.dart';
import 'package:project/providers/store_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/providers/whishlists_provider.dart';
import 'package:project/screens/cart_screen/cart_screen.dart';
import 'package:project/screens/comments_screen/comments_screen.dart';
import 'package:project/screens/holder_screen/holder_screen.dart';
import 'package:project/screens/login_screen/login_screen.dart';
import 'package:project/screens/no_internet_screen/no_internet_screen.dart';
import 'package:project/screens/offer_screen/offer_screen.dart';
import 'package:project/screens/orders_screen/orders_screen.dart';
import 'package:project/screens/product_screen/product_screen.dart';
import 'package:project/screens/profile_screen/profile_screen.dart';
import 'package:project/screens/search_screen/search_screen.dart';
import 'package:project/screens/signup_screen/signup_screen.dart';
import 'package:project/screens/signup_store_screen/signup_store_screen.dart';
import 'package:project/screens/store_screen/store_screen.dart';
import 'package:project/screens/testing_screen/testing_screen.dart';
import 'package:project/screens/track_order_screen/track_order_screen.dart';
import 'package:project/screens/trend_screen/trend_screen.dart';
import 'package:project/screens/upload_data_screen/upload_data_screen.dart';
import 'package:provider/provider.dart';

bool testing = false;
Future main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => WishListsProvider()),
        ChangeNotifierProvider(create: (ctx) => StoreProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => SearchProvider()),
        ChangeNotifierProvider(create: (ctx) => OrdersProvider()),
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
        ChangeNotifierProvider(create: (ctx) => LocationProvider()),
      ],
      child: MaterialApp(
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
        initialRoute:
            testing ? TestingScreen.routeName : HolderScreen.routeName,
        // initialRoute: UploadDataScreen.routeName,
        routes: {
          TestingScreen.routeName: (context) => TestingScreen(),
          HolderScreen.routeName: (context) => HolderScreen(),
          ProductScreen.routeName: (context) => ProductScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          StoreScreen.routeName: (context) => StoreScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          SignUpStoreScreen.routeName: (context) => SignUpStoreScreen(),
          CommentsScreen.routeName: (context) => CommentsScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          TrackOrderScreen.routeName: (context) => TrackOrderScreen(),
          TrendScreen.routeName: (context) => TrendScreen(),
          UploadDataScreen.routeName: (context) => UploadDataScreen(),
          OfferScreen.routeName: (context) => OfferScreen(),
          NoInternetScreen.routeName: (context) => NoInternetScreen(),
        },
      ),
    );
  }
}
