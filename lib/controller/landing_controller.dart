import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/controller/auth/login.dart';
import 'package:store_app/utils/middleware/storage/get_storage_middle_ware.dart';
import 'package:store_app/views/screens/main_screen.dart';

class LandingScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final _login = Get.lazyPut(
    () => LoginController(),
    fenix: true,
  );
  final LoginController _loginController = Get.find();
  final List<String> _images = [
    'assets/landing/landing1.jpg',
    'assets/landing/landing2.jpg',
    'assets/landing/landing3.jpg',
  ];

  List get images => _images;

  AnimationController get animationController => _animationController;

  Animation get animation => _animation;

  static final GetStorageMiddleWare _themeMiddleware = GetStorageMiddleWare();
  bool firstTime =
      _themeMiddleware.getValue(key: 'isFirstTimelandingScreen') ?? true;
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

  void signInAsAGuest() async {
    await FirebaseAuth.instance.signInAnonymously();
    Get.offNamed(MainScreen.routeName);
  }

  void signInWithGoogle() async {
    log('tapped');
    await _loginController.signInWithGoogle();
  }

  void signInWithFacebook() async {
    await _loginController.signInWithFacebook();
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
