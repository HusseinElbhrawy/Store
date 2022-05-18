import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/views/widgets/custom_dialog.dart';

class FullOrderScreen extends StatelessWidget {
  const FullOrderScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: GetBuilder(
          // init: CartController(),
          builder: (CartController controller) {
            return Text(
              'Cart(${controller.cartItems.length})',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              customDialog(
                onTap: () {
                  Get.back();
                  // cartController.deletedAllProduct();
                },
              );
            },
            icon: const Icon(
              Icons.delete_outlined,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        // itemCount: cartController.cartItems.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const Text('Data'),
      ),
    );
  }
}
