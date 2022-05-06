import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';
import 'package:store_app/views/widgets/custom_cached_network_image.dart';

class BrandInnerScreenItemWidget extends StatelessWidget {
  const BrandInnerScreenItemWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          ProductDetailsScreen.routeName,
          arguments: productModel,
        );
      },
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        margin: const EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: const BoxConstraints(
          minHeight: 150,
          minWidth: double.infinity,
          maxHeight: 180,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  height: double.infinity,
                  progressIndicatorBuilder: cachedNetworkImageLoadingWidget,
                  errorWidget: cachedNetworkImageErrorWidget,
                  imageUrl: productModel.imageUrl,
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                width: 160,
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  // color: Theme.of(context).backgroundColor,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title,
                      maxLines: 4,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    FittedBox(
                      child: Text(
                        'US ${productModel.price.toString()} \$',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(productModel.productCategoryName,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 18.0)),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
