import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/bottom_nav_controller.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavBarcontroller());
    return GetBuilder(
      builder: (BottomNavBarcontroller controller) {
        return Scaffold(
          // appBar: AppBar(
          //   centerTitle: true,
          //   title: Text(
          //       controller.screens[controller.currentIndex]['appBarTitle']),
          // ),
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
            notchMargin: 8.0,
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                ),
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
        );
      },
    );
  }
}
