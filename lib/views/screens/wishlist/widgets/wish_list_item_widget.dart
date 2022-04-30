import 'package:flutter/material.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/model/cart.dart';

class WishListItemWidget extends StatelessWidget {
  const WishListItemWidget({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);
  final CartModel product;
  final WishController controller;
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        horizontalTitleGap: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.all(20),
        minVerticalPadding: 25,
        iconColor: Colors.red,
        tileColor: Colors.white,
        leading: Image.network(
          product.imageUrl,
          height: double.infinity,
          width: 50,
        ),
        title: Text(product.title),
        subtitle: Text('${product.price.toStringAsFixed(2)} \$'),
        trailing: IconButton(
          onPressed: () {
            controller.removeFromWishList(id: product.id);
          },
          icon: const Icon(MyIcons.delete),
        ),
      ),
    );
  }
}
