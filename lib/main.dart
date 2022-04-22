import 'package:flutter/material.dart';
import 'package:store_app/views/widgets/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Store',
      home: const BottomNavigationBarWidget(),
    );
  }
}
