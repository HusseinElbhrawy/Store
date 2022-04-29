import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/model/cart.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';

class PopularProductsItemWidget extends StatelessWidget {
  const PopularProductsItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          ProductDetailsScreen.routeName,
          arguments: product,
          parameters: {
            'isCommingFromFeeds': 'false',
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 250,
        width: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Image.network(
              product.imageUrl,
              height: 150,
              width: double.infinity,
            ),
            PositionedDirectional(
              top: 155,
              start: 0.0,
              end: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(color: Colors.transparent),
                    Text(
                      product.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Divider(color: Colors.transparent),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_outline,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                child: Text('${product.price.toString()} \$'),
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            GetBuilder(
              init: CartController(),
              autoRemove: false,
              builder: (CartController controller) {
                return Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      icon: const Icon(MyIcons.shopCart),
                      onPressed: controller.isAddedToCart(id: product.id)
                          ? null
                          : () {
                              controller.addToCart(
                                product: CartModel(
                                  id: product.id,
                                  title: product.title,
                                  price: product.price,
                                  quantity: 1,
                                  imageUrl: product.imageUrl,
                                ),
                              );
                            },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
