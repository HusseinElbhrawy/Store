import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/middleware/theme/theme.dart';

class InfoScreenController extends GetxController {
  // static final List<IconData> _userTileIcons = [
  //   Icons.email,
  //   Icons.phone,
  //   Icons.local_shipping,
  //   Icons.watch_later,
  //   Icons.exit_to_app_rounded,
  // ];

  ///For Floating Action Button and CustomScrollView
  ScrollController controller = ScrollController();
  double offset = 0;
  double top = 0.0;

  ///For DarkListTile(Dark Mode)
  static final ThemeMiddleWare _themeMiddleware = ThemeMiddleWare();

  bool _isDarkMode =
      _themeMiddleware.getThemeStatus(key: 'isDarkTheme') ?? false;
  bool get isDarkMode => _isDarkMode;
  void changeTheme({required bool newValue}) {
    _isDarkMode = newValue;
    log(_isDarkMode.toString());
    _themeMiddleware.setValue(key: 'isDarkTheme', status: _isDarkMode);
    update();
  }

  @override
  void onInit() {
    controller.addListener(() {
      offset = controller.offset;
      update();
    });
    super.onInit();
  }
}
