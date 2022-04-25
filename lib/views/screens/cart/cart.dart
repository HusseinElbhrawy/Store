import 'package:flutter/material.dart';
import 'package:store_app/views/screens/cart/empty_cart.dart';
import 'package:store_app/views/screens/cart/full_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productions = [0];
    if (productions.isEmpty) {
      return const EmptyCart();
    } else {
      return const FullCart();
    }
  }
}
