import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/model/cart.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/feeds/widgets/quick_view_custom_icon_button.dart';
import 'package:store_app/views/screens/product_details/product_details.dart';

class CustomFeedScreenDialog extends StatelessWidget {
  const CustomFeedScreenDialog({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: MediaQuery.of(context).size.height * 0.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              // color: Colors.transparent,
            ),
            child: Image.network(
              productModel.imageUrl,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).scaffoldBackgroundColor,
            // color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GetBuilder(
                  init: WishController(),
                  builder: (WishController controller) {
                    return QuickViewCustomIconButton(
                      iconData:
                          controller.isAddedToWishList(id: productModel.id)
                              ? MyIcons.heart
                              : MyIcons.emptyHeart,
                      onTap: () {
                        if (controller.isAddedToWishList(id: productModel.id)) {
                          controller.removeFromWishList(id: productModel.id);
                        } else {
                          controller.addToWishList(
                            product: CartModel(
                              id: productModel.id,
                              title: productModel.title,
                              price: productModel.price,
                              quantity: productModel.quantity,
                              imageUrl: productModel.imageUrl,
                            ),
                          );
                        }
                      },
                      title: 'Add to wishlist',
                      color: controller.isAddedToWishList(id: productModel.id)
                          ? Colors.red
                          : Colors.grey.shade700,
                    );
                  },
                ),
                QuickViewCustomIconButton(
                  iconData: MyIcons.eye,
                  color: Colors.grey.shade700,
                  onTap: () async {
                    await Get.toNamed(
                      ProductDetailsScreen.routeName,
                      arguments: productModel,
                    );
                    Get.back();
                  },
                  title: 'View Product',
                ),
                GetBuilder(
                  init: CartController(),
                  builder: (CartController controller) {
                    return QuickViewCustomIconButton(
                      iconData: MyIcons.emptyShopCart,
                      color: controller.isAddedToCart(id: productModel.id)
                          ? Colors.red
                          : Colors.grey.shade700,
                      onTap: () {
                        if (controller.isAddedToCart(id: productModel.id)) {
                          controller.deleteItem(id: productModel.id);
                        } else {
                          controller.addToCart(
                            product: CartModel(
                              id: productModel.id,
                              title: productModel.title,
                              price: productModel.price,
                              quantity: productModel.quantity,
                              imageUrl: productModel.imageUrl,
                            ),
                          );
                        }
                      },
                      title: 'Add to Cart',
                    );
                  },
                ),
              ],
            ),
          ),

          /************close****************/
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.3),
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: Colors.grey,
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(MyIcons.close, size: 28, color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
