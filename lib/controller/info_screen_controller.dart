import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/middleware/storage/get_storage_middle_ware.dart';

class InfoScreenController extends GetxController {
  bool isLoading = false;
  final User _currentUser = FirebaseAuth.instance.currentUser!;
  late final DocumentSnapshot? _userDoc;
  late final String userName, userEmail, userPhoneNumber, imageUrl;
  late final DateTime userJoinnedDate;

  ///For Floating Action Button and CustomScrollView
  ScrollController controller = ScrollController();
  double offset = 0;
  double top = 0.0;

  static final GetStorageMiddleWare _themeMiddleware = GetStorageMiddleWare();

  bool _isDarkMode = _themeMiddleware.getValue(key: 'isDarkTheme') ?? false;
  bool get isDarkMode => _isDarkMode;
  void changeTheme({required bool newValue}) {
    _isDarkMode = newValue;
    log(_isDarkMode.toString());
    _themeMiddleware.setValue(key: 'isDarkTheme', status: _isDarkMode);
    update();
  }

  Future<void> getUserData() async {
    isLoading = true;
    _userDoc = _currentUser.isAnonymous
        ? null
        : await FirebaseFirestore.instance
            .collection('Users')
            .doc(_currentUser.uid)
            .get();
    // userEmail = _currentUser.email!;
    if (_userDoc == null) {
      return;
    } else {
      userEmail = _userDoc!.get('email');
      userName = _userDoc!.get('fullName');
      imageUrl = _userDoc!.get('imageUrl');
      userPhoneNumber = _userDoc!.get('phoneNumber');
      userJoinnedDate = _userDoc!.get('joinnedDate').toDate();
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() async {
    controller.addListener(() {
      offset = controller.offset;
      update();
    });
    await getUserData();

    super.onInit();
  }
}
