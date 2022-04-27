import 'package:flutter/material.dart';
import 'package:store_app/constants/icons.dart';

class FullWishlist extends StatelessWidget {
  const FullWishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlish(0)',
        ),
      ),
      body: Ink(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          horizontalTitleGap: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.all(20),
          minVerticalPadding: 25,
          iconColor: Colors.red,
          tileColor: Colors.grey.shade400,
          leading: Image.asset('assets/images/CatShoes.jpg'),
          title: const Text('Title'),
          subtitle: const Text('Price \$'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(MyIcons.delete),
          ),
        ),
      ),
    );
  }
}
