import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/views/screens/cart/widgets/empty_cart.dart';
import 'package:store_app/views/screens/cart/widgets/full_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return GetBuilder(
      builder: (CartController controller) {
        if (cartController.cartItems.isEmpty) {
          return const EmptyCart();
        } else {
          return FullCart(cartController: cartController);
        }
      },
    );
  }
}
