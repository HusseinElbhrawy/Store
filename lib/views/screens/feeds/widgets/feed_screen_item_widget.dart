import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/feeds/widgets/custom_feed_screen_dialog.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';

class FeedScreenItem extends StatelessWidget {
  const FeedScreenItem({
    Key? key,
    this.product,
    this.comeFromFeed,
  }) : super(key: key);
  final ProductModel? product;
  final bool? comeFromFeed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log(Get.previousRoute);
        comeFromFeed == true
            ? Get.toNamed(
                ProductDetailsScreen.routeName,
                arguments: product,
                parameters: {
                  'commingFromFeeds': 'true',
                },
              )
            : Get.offNamed(
                ProductDetailsScreen.routeName,
                arguments: product,
                parameters: {
                  'commingFromFeeds': 'true',
                },
              );
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                product == null
                    ? Image.asset(
                        'assets/images/CatLaptops.png',
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        product!.imageUrl,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 2.5,
                      ),
                Text(
                  product == null ? 'Product Name' : product!.title.toString(),
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  product == null ? 'Product Price' : product!.price.toString(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product == null ? 'Empty' : product!.productCategoryName,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    ),
                    const Spacer(),
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        splashColor: Colors.red,
                        onPressed: () {
                          Get.dialog(
                            CustomFeedScreenDialog(
                              productModel: product!,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xffAA88E5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('New'),
          ),
        ],
      ),
    );
  }
}
