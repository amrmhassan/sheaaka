// ignore_for_file: prefer_const_constructors

import 'package:project/models/navbar_icons_models.dart';
import 'package:project/screens/categories_screen/categories_screen.dart';
import 'package:project/screens/followed_stores_screen/followed_stores_screen.dart';
import 'package:project/screens/home_screen/home_screen.dart';
import 'package:project/screens/nearby_stores_screen/nearby_stores_screen.dart';
import 'package:project/screens/wishlist_screen/wishlist_screen.dart';

List<NavBarIcon> navBarIconsList = [
  NavBarIcon('home1', 'home', HomeScreen()),
  NavBarIcon('category', 'menu', CategoriesScreen()),
  NavBarIcon('add-friend1', 'add-friend', FollowedStoresScreen()),
  NavBarIcon('bookmark', 'book-mark', WishlistScreen()),
  NavBarIcon('nearby', 'nearby1', NearbyStoresScreen()),
];
