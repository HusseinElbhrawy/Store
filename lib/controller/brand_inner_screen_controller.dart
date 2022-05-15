import 'package:get/get.dart';
import 'package:store_app/controller/home_controller.dart';

class BrandInnerScreenController extends GetxController {
  late int currentIndex;
  late List list;
  late Map values;
  void updateIndex({required int newIndex}) {
    currentIndex = newIndex;
    update();
  }

  String? getBrandName() {
    if (currentIndex == 0) {
      return 'Addidas';
    }
    if (currentIndex == 1) {
      return 'Apple';
    }
    if (currentIndex == 2) {
      return 'Dell';
    }
    if (currentIndex == 3) {
      return 'H&M';
    }
    if (currentIndex == 4) {
      return 'Huawei';
    }
    if (currentIndex == 5) {
      return 'Nike';
    }
    if (currentIndex == 6) {
      return 'Samsung';
    }
    update();
    return null;
  }

  final HomeController homeController = Get.find();
  void filterData({required String value}) {
    list = homeController.kProducts.where((element) {
      return element.brand.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }

  void initData() {
    list = homeController.kProducts.where((element) {
      return element.brand
          .toLowerCase()
          .contains(values['brandName'].toLowerCase());
    }).toList();
    currentIndex = values['index'];
  }

  @override
  void onInit() {
    values = Get.arguments;
    initData();

    super.onInit();
  }
}
