import 'package:flutter/material.dart';
import 'package:store_app/constants/icons.dart';

class ProductInfoBottomNavBarWidget extends StatelessWidget {
  const ProductInfoBottomNavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {},
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Add To cart'.toUpperCase(),
                  ),
                ),
              ),
            ),
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
                    'Buy now 💳'.toUpperCase(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.grey.shade400,
                ),
              ),
              onPressed: () {},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: AlignmentDirectional.center,
                child: const Icon(
                  MyIcons.emptyHeart,
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
