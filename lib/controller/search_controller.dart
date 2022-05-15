import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/model/product_moel.dart';

class SearchController extends GetxController {
  final HomeController _homeController = Get.find();
  final TextEditingController searchController = TextEditingController();
  late List<ProductModel> product;
  late List<ProductModel> searchList;
  void _initProductList() {
    product = _homeController.kProducts;
    searchList = product;
    update();
  }

  void searchInproductList({required String productName}) {
    searchList = product
        .where(
          (element) => element.title.toLowerCase().contains(
                productName.toLowerCase(),
              ),
        )
        .toList();

    update();
  }

  void clearTextFormFiled() {
    searchController.clear();
    searchList = product;
    update();
  }

  @override
  void onInit() {
    _initProductList();
    super.onInit();
  }
}
