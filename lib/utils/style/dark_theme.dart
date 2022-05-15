import 'package:flutter/material.dart';

//mainColor: Color(0xff171D2D)
//SubColor: Color.fromARGB(255, 35, 43, 65)
ThemeData kDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff171D2D),
  primaryColor: const Color.fromARGB(255, 35, 43, 65),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),

  // bottomAppBarColor: const Color(0xff171D2D),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    shape: CircularNotchedRectangle(),
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(
      color: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
);
