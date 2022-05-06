import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:store_app/views/screens/upload_product/upload_product.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/mainScreen';
  @override
  Widget build(BuildContext context) {
    GlobalKey _one = GlobalKey();

    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          WidgetsBinding.instance!.addPostFrameCallback(
              (_) => ShowCaseWidget.of(context)!.startShowCase([_one]));
          return PageView(
            children: const [
              BottomNavigationBarWidget(),
              UploadProductScreen(),
            ],
          );
        },
      ),
    );
  }
}
