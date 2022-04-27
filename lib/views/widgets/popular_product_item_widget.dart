import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:store_app/views/screens/product_details.dart';

class PopularProductsItemWidget extends StatelessWidget {
  const PopularProductsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(ProductDetailsScreen.routeName);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 220,
        width: 190,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          // alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.asset(
              'assets/images/Huawei.jpg',
              width: double.infinity,
              height: 150,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              heightFactor: 6,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Text('Name 2'),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Material(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_outline,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.black,
                  ),
                ),
                child: const Text('Testing'),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: const Icon(Entypo.info),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
