import 'package:flutter/material.dart';
import 'package:store_app/utils/style/colors.dart';

ThemeData kLightTheme = ThemeData(
  scaffoldBackgroundColor: ConstColors.backgroundColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);
