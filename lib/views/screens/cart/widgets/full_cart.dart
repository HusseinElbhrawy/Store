import 'package:flutter/material.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/views/screens/cart/widgets/cart_Item.dart';

class FullCart extends StatelessWidget {
  const FullCart({
    Key? key,
    required this.cartController,
  }) : super(key: key);
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: const Text(
          'Cart(1)',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cartController.deletedAllProduct();
            },
            icon: const Icon(
              Icons.delete_outlined,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) => CartItem(
          products: cartController.cartItems.values.toList()[index],
          index: index,
          // products: cartController.cartItems.values.toList()[index],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 14)),
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 25)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                child: Text(
                  'Checkout'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: "Total:\t",
                  children: [
                    TextSpan(
                      text:
                          "US \$${cartController.totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
