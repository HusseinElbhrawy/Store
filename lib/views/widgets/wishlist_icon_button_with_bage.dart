import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/views/screens/wishlist/wishlist.dart';

class WishlistIconButtonWithBadge extends StatelessWidget {
  const WishlistIconButtonWithBadge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: WishController(),
      builder: (WishController controller) {
        return Badge(
          badgeColor: Colors.red,
          animationType: BadgeAnimationType.slide,
          position: BadgePosition.topEnd(top: 0.0, end: 0),
          toAnimate: true,
          badgeContent: Text(controller.wishList.length.toString()),
          child: IconButton(
            onPressed: () {
              Get.toNamed(Wishlist.routeName);
            },
            icon: const Icon(
              MyIcons.emptyHeart,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
