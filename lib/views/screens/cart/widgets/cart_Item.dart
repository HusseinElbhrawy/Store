import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/utils/style/colors.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/model/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);
  final CartModel products;
  final int index;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.network(
              products.imageUrl,
              width: double.infinity,
              // fit: BoxFit.fill,
              height:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 150
                      : 120,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.mediaQuery.size.width / 2.5,
                      child: Text(
                        products.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        cartController.deleteItem(id: products.id);
                      },
                      icon: const Icon(
                        Icons.clear_outlined,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                Text(
                  'Price ${products.price}',
                ),
                Text(
                  'Sub Total: ${(products.price * products.quantity).toStringAsFixed(2)}',
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      flex: 0,
                      child: Text(
                        'Shops Fees',
                      ),
                    ),
                    const Spacer(),
                    GetBuilder(
                      autoRemove: false,
                      init: CartController(),
                      builder: (CartController controller) {
                        return Flexible(
                          flex: 0,
                          child: Row(
                            children: [
                              IconButton(
                                splashColor: Colors.red,
                                splashRadius: 1,
                                onPressed: () {
                                  controller.decrement(
                                    product: CartModel(
                                      id: products.id,
                                      title: products.title,
                                      price: products.price,
                                      quantity: products.quantity + 1,
                                      imageUrl: products.imageUrl,
                                    ),
                                  );
                                  if (products.quantity == 1) {
                                    Get.snackbar(
                                      'Warning',
                                      'You can\'t decrement item less than one',
                                      backgroundColor: Colors.white70,
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Entypo.minus,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue,
                                      ConstColors.gradiendFStart,
                                    ],
                                  ),
                                ),
                                alignment: AlignmentDirectional.center,
                                child: Text(products.quantity.toString()),
                              ),
                              IconButton(
                                splashColor: Colors.red,
                                splashRadius: 1,
                                onPressed: () {
                                  controller.increment(
                                    product: CartModel(
                                      id: products.id,
                                      title: products.title,
                                      price: products.price,
                                      quantity: products.quantity + 1,
                                      imageUrl: products.imageUrl,
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Entypo.plus,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
