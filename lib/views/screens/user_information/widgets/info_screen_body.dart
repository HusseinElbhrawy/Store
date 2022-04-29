import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/info_screen_controller.dart';
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
              iconData: MyIcons.emptyHeart,
              subTitle: '',
              title: 'Wishlist',
              tralling: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(Wishlist.routeName);
              },
            ),
            CustomUserListTile(
              iconData: MyIcons.shopCart,
              subTitle: '',
              title: 'Cart',
              tralling: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(CartScreen.routeName);
              },
            ),
            const CustomTitle(title: 'User Information'),
            const Divider(thickness: 2),
            CustomUserListTile(
              iconData: Icons.email,
              subTitle: 'Empty',
              title: 'Email',
              onTap: () {},
            ),
            CustomUserListTile(
              iconData: Icons.phone,
              subTitle: 'Empty',
              title: 'Phone Number',
              onTap: () {},
            ),
            const CustomUserListTile(
              iconData: Icons.local_shipping,
              subTitle: 'Empty',
              title: 'Shipping Address',
              onTap: null,
              // onTap: () {},
            ),
            CustomUserListTile(
              iconData: Icons.watch_later,
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
              iconData: Icons.exit_to_app_rounded,
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
