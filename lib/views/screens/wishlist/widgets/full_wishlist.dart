import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/views/screens/wishlist/widgets/wish_list_item_widget.dart';

class FullWishlist extends StatelessWidget {
  const FullWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WishController wishController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder(
          builder: (WishController controller) => Text(
            'Wishlish(${wishController.wishList.length})',
          ),
        ),
      ),
      body: GetBuilder(
        init: WishController(),
        builder: (WishController controller) {
          return ListView.builder(
            itemCount: controller.wishList.length,
            itemBuilder: (BuildContext context, int index) {
              return WishListItemWidget(
                controller: controller,
                product: controller.wishList.values.toList()[index],
              );
            },
          );
        },
      ),
    );
  }
}
