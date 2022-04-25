import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:store_app/constants/colors.dart';

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
