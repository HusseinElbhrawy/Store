import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/views/widgets/feed_screen_item_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static const routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feeds',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xffE1DFE1),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          children: [
            ...List.generate(
              kProducts.length,
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
                  child: FeedScreenItem(product: kProducts[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
