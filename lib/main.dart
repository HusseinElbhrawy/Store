import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/constants/colors.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ConstColors.backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Store',
      // home: const FeedsScreen(),
      home: const BottomNavigationBarWidget(),
    );
  }
}
