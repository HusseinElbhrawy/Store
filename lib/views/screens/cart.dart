import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/screens/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List productions = [1];
    return productions.isEmpty
        ? const EmptyCart()
        : Scaffold(
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

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(18),
          bottomEnd: Radius.circular(18),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/CatWatches.jpg',
              fit: BoxFit.fill,
              height:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 120
                      : null,
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
                    Flexible(
                      flex: 0,
                      child: Text(
                        'Samsung 21',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.clear_outlined,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
                const Text(
                  'Price 430.0',
                ),
                const Text(
                  'Sub Total: 430.0',
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
                    Flexible(
                      flex: 0,
                      child: Row(
                        children: [
                          IconButton(
                            splashColor: Colors.red,
                            splashRadius: 1,
                            onPressed: () {},
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
                            child: const Text('1'),
                          ),
                          IconButton(
                            splashColor: Colors.red,
                            splashRadius: 1,
                            onPressed: () {},
                            icon: const Icon(
                              Entypo.plus,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
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
