import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.categoriesImages,
    required this.name,
  }) : super(key: key);

  final String categoriesImages, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 35, 43, 65),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Image.asset(
              categoriesImages,
              // height: MediaQuery.of(context).size.height / 10,
              height: 100,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
