import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/utils/middleware/theme/theme.dart';

class LandingScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final List<String> _images = [
    'https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo=',
    'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1138257321%2F0x0.jpg%3Ffit%3Dscale',
    'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
    'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
  ];

  List get images => _images;

  AnimationController get animationController => _animationController;

  Animation get animation => _animation;

  static final ThemeMiddleWare _themeMiddleware = ThemeMiddleWare();
  bool firstTime =
      _themeMiddleware.getThemeStatus(key: 'isFirstTimelandingScreen') ?? true;
  void initShowCase({required context}) {
    if (firstTime) {
      WidgetsBinding.instance!.addPostFrameCallback((_) =>
          ShowCaseWidget.of(context)!.startShowCase(ids.values.toList()));
    } else {
      return;
    }
  }

  Map<String, GlobalKey<State<StatefulWidget>>> ids = {
    'landingLogin': GlobalKey(debugLabel: 'landingLogin'),
    'landingSignup': GlobalKey(debugLabel: 'landingSignup'),
    'landingorConnectWith': GlobalKey(debugLabel: 'landingorConnectWith'),
  };
  void onFinish() {
    firstTime = false;
    log(firstTime.toString());
    _themeMiddleware.setValue(
        status: firstTime, key: 'isFirstTimelandingScreen');
    update();
  }

  @override
  void onInit() {
    _images.shuffle();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 20,
      ),
    )..repeat();
    _animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    );
    super.onInit();
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
