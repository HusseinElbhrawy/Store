import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/emptycart.png',
          ),
          Text(
            'Your Card Is Empty',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Looks like you haven\'t \n add any item yo your cart yet!',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.grey,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 14)),
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 25)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              child: Text(
                'Shop now'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container(
//             margin: const EdgeInsets.all(25),
//             child: MaterialButton(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               onPressed: () {},
//               minWidth: double.infinity,
//               color: Colors.red,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Text(
//                 'Shop now'.toUpperCase(),
//                 style: Theme.of(context).textTheme.headline6!.copyWith(
//                       color: Colors.white,
//                     ),
//               ),
//             ),
//           )