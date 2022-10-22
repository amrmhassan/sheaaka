// ignore_for_file: prefer_const_constructors

import 'package:project/models/navbar_icons_models.dart';
import 'package:project/screens/categories_screen/categories_screen.dart';
import 'package:project/screens/home_screen/home_screen.dart';
import 'package:project/screens/nearby_stores_screen/nearby_stores_screen.dart';
import 'package:project/screens/trend_screen/trend_screen.dart';
import 'package:project/screens/wishlist_screen/wishlist_screen.dart';
import 'package:project/trader_app/screens/t_home_screen/t_home_screen.dart';
import 'package:project/trader_app/screens/t_orders_screen/t_orders_screen.dart';
import 'package:project/trader_app/screens/t_stats_screen/t_stats_screen.dart';

//? normal user nav bar icons
List<NavBarIcon> navBarIconsList(bool loadingData) => [
      NavBarIcon(
        'home1',
        'home',
        HomeScreen(
          loadingData: loadingData,
        ),
      ),
      NavBarIcon(
        'category',
        'menu',
        CategoriesScreen(),
      ),
      NavBarIcon(
        'add-friend1',
        'add-friend',
        TrendScreen(),
      ),
      NavBarIcon(
        'bookmark',
        'book-mark',
        WishlistScreen(),
      ),
      NavBarIcon(
        'nearby',
        'nearby1',
        NearbyStoresScreen(),
      ),
    ];

//? trader nav bar icons
List<NavBarIcon> traderNavBarIconsList = [
  NavBarIcon('trend1', 'trend', TStatsScreen()),
  NavBarIcon('home1', 'home', THomeScreen()),
  NavBarIcon('shopping-bag1', 'shopping-bag', TOrdersScreen()),
];
