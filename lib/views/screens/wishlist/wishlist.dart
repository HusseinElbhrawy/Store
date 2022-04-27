import 'package:flutter/material.dart';
import 'package:store_app/views/screens/wishlist/empty_wishlist.dart';
import 'package:store_app/views/screens/wishlist/full_wishlist.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);
  static const routeName = '/wishlist';
  @override
  Widget build(BuildContext context) {
    List wishlist = [1];
    return Scaffold(
      // appBar: AppBar(),
      body: wishlist.isEmpty ? const EmptyWishlist() : const FullWishlist(),
    );
  }
}
