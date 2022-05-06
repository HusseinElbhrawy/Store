import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/utils/middleware/theme/theme.dart';

class HomeController extends GetxController {
  static final ThemeMiddleWare _themeMiddleware = ThemeMiddleWare();
  bool firstTime =
      _themeMiddleware.getThemeStatus(key: 'isFirstTimeHomeScreen') ?? true;
  void initShowCase({required context}) {
    if (firstTime) {
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          ShowCaseWidget.of(context)!.startShowCase(ids.values.toList()));
    } else {
      return;
    }
  }

  Map<String, GlobalKey<State<StatefulWidget>>> ids = {
    'slide': GlobalKey(debugLabel: 'slide'),
    'toggle': GlobalKey(debugLabel: 'toggle'),
  };

  void onFinish() {
    firstTime = false;
    _themeMiddleware.setValue(status: firstTime, key: 'isFirstTimeHomeScreen');
    log(firstTime.toString());
    update();
  }
}
