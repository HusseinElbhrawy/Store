import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/constants/icons.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/model/cart.dart';
import 'package:store_app/model/product_moel.dart';
import 'package:store_app/views/screens/product_details/widgets/product_info_body.dart';
import 'package:store_app/views/screens/product_details/widgets/product_info_bottm_nav_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/productDetails';
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.arguments;
    final CartController cartController = Get.put(
      CartController(),
      permanent: true,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyIcons.emptyHeart,
              color: Colors.red,
            ),
          ),
          GetBuilder(
            builder: (CartController controller) {
              return IconButton(
                onPressed: controller.isAddedToCart(id: product.id)
                    ? null
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
                icon: const Icon(
                  MyIcons.shopCart,
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(product.imageUrl.toString()),
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.2,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: ProductInfoBody(product: product),
          ),
        ],
      ),
      bottomNavigationBar: ProductInfoBottomNavBarWidget(product: product),
    );
  }
}
