import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/constant.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/views/screens/feeds/widgets/feed_screen_item_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/categoryScreen';
  static late List list;
  @override
  Widget build(BuildContext context) {
    String categoryName = Get.arguments;
    var list = kProducts.where(
      (element) {
        return element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase());
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        actions: [
          IconButton(
            onPressed: () {
              log(list.length.toString());
              // log(categoryName.toString());
            },
            icon: const Icon(
              MyIcons.emptyHeart,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyIcons.shopCart,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .55,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          log(list.length.toString());
          return FeedScreenItem(
            product: list[index],
            comeFromFeed: false,
          );
        },
      ),
    );
  }
}
