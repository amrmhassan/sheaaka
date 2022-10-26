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
        active: 'home1',
        inactive: 'home',
        widget: HomeScreen(
          loadingData: loadingData,
        ),
      ),
      NavBarIcon(
        active: 'category',
        inactive: 'menu',
        widget: CategoriesScreen(),
      ),
      NavBarIcon(
        active: 'fire',
        inactive: 'fire-bold',
        widget: TrendScreen(),
        // isMain: true,
      ),
      NavBarIcon(
        active: 'bookmark',
        inactive: 'book-mark',
        widget: WishlistScreen(),
      ),
      NavBarIcon(
        active: 'nearby',
        inactive: 'nearby1',
        widget: NearbyStoresScreen(),
      ),
    ];

//? trader nav bar icons
List<NavBarIcon> traderNavBarIconsList = [
  NavBarIcon(
    active: 'trend1',
    inactive: 'trend',
    widget: TStatsScreen(),
  ),
  NavBarIcon(
    active: 'home1',
    inactive: 'home',
    widget: THomeScreen(),
  ),
  NavBarIcon(
    active: 'shopping-bag1',
    inactive: 'shopping-bag',
    widget: TOrdersScreen(),
  ),
];
