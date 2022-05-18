import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/views/screens/orders/widgets/empty_order_screen.dart';
import 'package:store_app/views/screens/orders/widgets/full_order_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = '/orderScreen';
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CartController controller) {
        if (true) {
          return const EmptyOrderScreen();
        } else {
          return const FullOrderScreen();
        }
      },
    );
  }
}
