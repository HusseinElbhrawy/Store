import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/views/screens/cart/cart.dart';
import 'package:store_app/views/screens/feeds.dart';
import 'package:store_app/views/screens/wishlist/wishlist.dart';
import 'package:store_app/views/widgets/back_layer_menu_item_widget.dart';

class BackLayerMenu extends StatelessWidget {
  const BackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ConstColors.starterColor,
                ConstColors.endColor,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          top: -100.0,
          left: 140.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 100.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 300,
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          left: 60.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      // clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                BackLayerMenuItemWidget(
                  iconData: MyIcons.rss,
                  title: 'Feeds',
                  onTap: () {
                    Get.toNamed(FeedsScreen.routeName);
                  },
                ),
                BackLayerMenuItemWidget(
                  iconData: Icons.rss_feed_rounded,
                  title: 'Cart',
                  onTap: () {
                    Get.toNamed(CartScreen.routeName);
                  },
                ),
                BackLayerMenuItemWidget(
                  iconData: Icons.rss_feed_rounded,
                  title: 'Wishlist',
                  onTap: () {
                    Get.toNamed(Wishlist.routeName);
                  },
                ),
                BackLayerMenuItemWidget(
                  iconData: Icons.rss_feed_rounded,
                  title: 'Upload a new Product',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
