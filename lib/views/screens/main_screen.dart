import 'package:flutter/material.dart';
import 'package:store_app/views/screens/upload_product/upload_product.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/mainscreen';
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        BottomNavigationBarWidget(),
        UploadProductScreen(),
      ],
    );
  }
}
