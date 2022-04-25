import 'package:flutter/material.dart';
import 'package:store_app/views/widgets/cart_Item.dart';

class FullCart extends StatelessWidget {
  const FullCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.white,
        leading: const Center(
          child: Text(
            'Cart(1)',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outlined,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const CartItem(),
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
                const TextSpan(
                  text: "Total:\t",
                  children: [
                    TextSpan(
                        text: "US \$400.000",
                        style: TextStyle(color: Colors.blue))
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
