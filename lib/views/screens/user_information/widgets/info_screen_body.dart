import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/info_screen_controller.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/views/screens/cart/cart.dart';
import 'package:store_app/views/screens/wishlist/wishlist.dart';
import 'package:store_app/views/widgets/custom_title.dart';
import 'package:store_app/views/widgets/custom_user_listtile.dart';

class InfoScreenBody extends StatelessWidget {
  const InfoScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfoScreenController infoScreenController = Get.find();
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(title: 'User Bag'),
            const Divider(thickness: 2),
            CustomUserListTile(
              leading: GetBuilder(
                init: WishController(),
                builder: (WishController controller) {
                  return SizedBox(
                    height: 35,
                    child: Stack(
                      children: [
                        PositionedDirectional(
                          top: 0.0,
                          end: 0.0,
                          width: 0,
                          child: Text(controller.wishList.isEmpty
                              ? ''
                              : controller.wishList.length.toString()),
                        ),
                        Icon(
                          controller.wishList.isEmpty
                              ? MyIcons.emptyHeart
                              : MyIcons.heart,
                          size: 25,
                          color: controller.wishList.isEmpty
                              ? Colors.grey
                              : Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
              subTitle: '',
              title: 'Wishlist',
              showNumber: true,
              tralling: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(Wishlist.routeName);
              },
            ),
            CustomUserListTile(
              leading: GetBuilder(
                  init: CartController(),
                  builder: (CartController controller) {
                    return SizedBox(
                      height: 35,
                      child: Stack(
                        children: [
                          PositionedDirectional(
                            top: 0.0,
                            end: 0.0,
                            width: 0,
                            child: Text(controller.cartItems.isEmpty
                                ? ''
                                : controller.cartItems.length.toString()),
                          ),
                          Icon(
                            MyIcons.shopCart,
                            size: 25,
                            color: controller.cartItems.isEmpty
                                ? Colors.grey
                                : Colors.red,
                          ),
                        ],
                      ),
                    );
                  }),
              subTitle: '',
              title: 'Cart',
              showNumber: true,
              tralling: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(CartScreen.routeName);
              },
            ),
            const CustomTitle(title: 'User Information'),
            const Divider(thickness: 2),
            CustomUserListTile(
              leading: const Icon(Icons.email),
              subTitle: 'Empty',
              title: 'Email',
              onTap: () {},
            ),
            CustomUserListTile(
              leading: const Icon(Icons.phone),
              subTitle: 'Empty',
              title: 'Phone Number',
              onTap: () {},
            ),
            const CustomUserListTile(
              leading: Icon(Icons.local_shipping),
              subTitle: 'Empty',
              title: 'Shipping Address',
              onTap: null,
              // onTap: () {},
            ),
            CustomUserListTile(
              leading: const Icon(Icons.watch_later),
              subTitle: 'Empty',
              title: 'Joinned Date',
              onTap: () {},
            ),
            const CustomTitle(title: 'User Settings'),
            const Divider(thickness: 2),
            GetBuilder(
              builder: (InfoScreenController controller) {
                return ListTileSwitch(
                  value: infoScreenController.isDarkMode,
                  onChanged: (newValue) {
                    controller.changeTheme(newValue: newValue);
                  },
                  title: const Text('Dark Mode'),
                  switchType: SwitchType.custom,
                  leading: const Icon(Icons.dark_mode_outlined),
                );
              },
            ),
            CustomUserListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              subTitle: '',
              title: 'Sign Out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
