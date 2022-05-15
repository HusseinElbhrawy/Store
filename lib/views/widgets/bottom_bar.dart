import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/bottom_nav_controller.dart';
import 'package:store_app/utils/style/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);
  static String routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarcontroller());

    return GetBuilder(
      builder: (BottomNavBarcontroller controller) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(0.0),
            child: FloatingActionButton(
              onPressed: () => controller.floatActionButtonOnPress(),
              child: const Icon(Linecons.search),
              backgroundColor: Colors.purple,
              hoverElevation: 10,
              splashColor: Colors.grey,
              tooltip: 'Search',
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          body: controller.screens[controller.currentIndex]['page'],
          bottomNavigationBar: BottomAppBar(
            color: ConstColors.backgroundColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Container(
                  color: Colors.red,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.purple,
                    currentIndex: controller.currentIndex,
                    elevation: 5.0,
                    type: BottomNavigationBarType.shifting,
                    onTap: (newIndex) =>
                        controller.bottomNavOnTao(newIndex: newIndex),
                    items: controller.bottomNavBarItems,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
