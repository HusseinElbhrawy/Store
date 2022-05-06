import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/views/screens/wishlist/widgets/empty_wishlist.dart';
import 'package:store_app/views/screens/wishlist/widgets/full_wishlist.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);
  static const routeName = '/wishlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GetBuilder(
        autoRemove: false,
        init: WishController(),
        builder: (WishController controller) {
          return controller.wishList.isEmpty
              ? const EmptyWishlist()
              : const FullWishlist();
        },
      ),
    );
  }
}
