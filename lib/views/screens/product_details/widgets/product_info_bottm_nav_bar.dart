import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/controller/wish_controller.dart';
import 'package:store_app/model/cart.dart';
import 'package:store_app/model/product_moel.dart';

class ProductInfoBottomNavBarWidget extends StatelessWidget {
  const ProductInfoBottomNavBarWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(
      CartController(),
      permanent: true,
    );
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          GetBuilder(
            builder: (CartController controller) {
              return Expanded(
                flex: 3,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      cartController.cartItems.containsKey(product.id)
                          ? Colors.grey.withOpacity(.9)
                          : Colors.red,
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: cartController.isAddedToCart(id: product.id)
                      ? () {
                          cartController.deleteItem(id: product.id);
                        }
                      : () {
                          cartController.addToCart(
                            product: CartModel(
                              id: product.id,
                              title: product.title,
                              price: product.price,
                              quantity: 1,
                              imageUrl: product.imageUrl,
                            ),
                          );
                        },
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        cartController.cartItems.containsKey(product.id)
                            ? 'Remove From Cart ?'.toUpperCase()
                            : 'Add To cart'.toUpperCase(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {},
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Buy now ????'.toUpperCase(),
                  ),
                ),
              ),
            ),
          ),
          GetBuilder(
            builder: (WishController controller) {
              return Expanded(
                flex: 1,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.shade400,
                    ),
                  ),
                  onPressed: () {
                    if (controller.isAddedToWishList(id: product.id)) {
                      controller.removeFromWishList(id: product.id);
                    } else {
                      controller.addToWishList(
                        product: CartModel(
                          id: product.id,
                          title: product.title,
                          price: product.price,
                          quantity: product.quantity,
                          imageUrl: product.imageUrl,
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: AlignmentDirectional.center,
                    child: Icon(
                      controller.isAddedToWishList(id: product.id)
                          ? MyIcons.heart
                          : MyIcons.emptyHeart,
                      color: controller.isAddedToWishList(id: product.id)
                          ? Colors.red
                          : Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
