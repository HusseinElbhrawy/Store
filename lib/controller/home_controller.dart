import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/utils/middleware/storage/get_storage_middle_ware.dart';

class HomeController extends GetxController {
  static final GetStorageMiddleWare _middleware = GetStorageMiddleWare();
  bool firstTime = _middleware.getValue(key: 'isFirstTimeHomeScreen') ?? true;
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
    _middleware.setValue(status: firstTime, key: 'isFirstTimeHomeScreen');
    log(firstTime.toString());
    update();
  }

  RxList<ProductModel> kProducts = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  Future fetchAllData() async {
    isLoading.value = true;
    FirebaseFirestore.instance
        .collection('Products')
        .orderBy('name')
        .snapshots()
        .listen((event) {
      kProducts.clear();
      for (var element in event.docs) {
        kProducts.add(ProductModel.fromMap(element.data()));
      }
    });
    kPopularProducts = kProducts.where((element) => element.isPopular).toList();
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    fetchAllData();
    super.onInit();
  }
}
