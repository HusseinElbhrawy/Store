import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/home_controller.dart';
import 'package:store_app/views/screens/feeds/widgets/feed_screen_item_widget.dart';
import 'package:store_app/views/widgets/cartlist_icon_button_with_badge.dart';
import 'package:store_app/views/widgets/wishlist_icon_button_with_bage.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/feeds';
  @override
  Widget build(BuildContext context) {
    var viewAll = Get.arguments;
    final HomeController homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewAll == 'true' ? 'Popular Products' : 'Feeds',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: const [
          WishlistIconButtonWithBadge(),
          CartListIconButtonWithBage(),
        ],
      ),
      backgroundColor: const Color(0xffE1DFE1),
      body: RefreshIndicator(
        onRefresh: () async {
          await homeController.fetchAllData();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            children: [
              ...List.generate(
                viewAll != null
                    ? homeController.kProducts
                        .where((element) => element.isPopular)
                        .toList()
                        .length
                    : homeController.kProducts.length,
                (index) {
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount:
                        Get.mediaQuery.orientation == Orientation.portrait
                            ? index.isEven
                                ? 3.7
                                : 3.9
                            : index.isEven
                                ? 2.5
                                : 3,
                    child: FeedScreenItem(
                      product: viewAll != null
                          ? homeController.kProducts
                              .where((element) => element.isPopular)
                              .toList()[index]
                          : homeController.kProducts[index],
                      comeFromFeed: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
