import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/views/screens/cart/cart.dart';

class CartListIconButtonWithBage extends StatelessWidget {
  const CartListIconButtonWithBage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GetBuilder(
        init: CartController(),
        builder: (CartController controller) {
          return Badge(
            badgeColor: const Color.fromARGB(255, 100, 73, 181),
            animationType: BadgeAnimationType.slide,
            position: BadgePosition.topEnd(top: 0.0, end: 0),
            toAnimate: true,
            badgeContent: Text(controller.cartItems.length.toString()),
            child: IconButton(
              onPressed: () {
                Get.toNamed(CartScreen.routeName);
              },
              icon: const Icon(
                MyIcons.emptyShopCart,
              ),
            ),
          );
        },
      ),
    );
  }
}
