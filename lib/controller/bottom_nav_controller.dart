import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/views/screens/cart/cart.dart';
import 'package:store_app/views/screens/feeds/feeds.dart';
import 'package:store_app/views/screens/home/home.dart';
import 'package:store_app/views/screens/search/search.dart';
import 'package:store_app/views/screens/user_information/user_info.dart';

class BottomNavBarcontroller extends GetxController {
  int currentIndex = 0;
  int counter = 0;
  final List<Map<String, dynamic>> screens = [
    {'page': const HomeScreen(), 'appBarTitle': 'Home'},
    {'page': const FeedsScreen(), 'appBarTitle': 'Feeds'},
    {'page': const SearchScreen(), 'appBarTitle': 'Search'},
    {'page': const CartScreen(), 'appBarTitle': 'Card'},
    {'page': const UserInfoScreen(), 'appBarTitle': 'User Info'},
  ];

  final List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(LineariconsFree.home),
      label: 'Home',
      tooltip: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesome.rss),
      label: 'Feeds',
      tooltip: 'Feeds',
    ),
    const BottomNavigationBarItem(
      icon: Icon(null),
      activeIcon: null,
      backgroundColor: null,
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined),
      label: 'Cart',
      tooltip: 'Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Linecons.user),
      label: 'User',
      tooltip: 'User',
    ),
  ];

  void bottomNavOnTao({required int newIndex}) {
    currentIndex = newIndex;
    counter++;
    update();
  }

  void floatActionButtonOnPress() {
    currentIndex = 2;
    counter++;
    update();
  }
}
